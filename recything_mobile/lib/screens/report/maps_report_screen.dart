import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsReportScreen extends StatefulWidget {
  const MapsReportScreen({super.key});

  @override
  State<MapsReportScreen> createState() => _MapsReportScreenState();
}

class _MapsReportScreenState extends State<MapsReportScreen> {
  Position? _currentPosition;
  String? _currentAddress;

  Future<void> _getCurrentPosition() async {
    PermissionStatus status = await _handleLocationPermission(context);

    if (status == PermissionStatus.granted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          _currentPosition = position;
          _getAddress(position);
        });
      } catch (e) {
        print('Error getting location: $e');
      }
    }
  }

  Future<PermissionStatus> _handleLocationPermission(
      BuildContext context) async {
    PermissionStatus status = await Permission.location.request();

    if (status == PermissionStatus.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Izin lokasi ditolak. Aktifkan izin di pengaturan aplikasi.'),
        ),
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Izin lokasi ditolak secara permanen. Buka pengaturan aplikasi untuk mengaktifkan izin.'),
        ),
      );
    } else if (status == PermissionStatus.granted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Izin lokasi diberikan.'),
        ),
      );
    }

    return status;
  }

  Future<void> _getAddress(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> listPlacemark) {
      setState(() {
        Placemark placemark = listPlacemark.first;
        _currentAddress =
            '${placemark.thoroughfare}, ${placemark.subThoroughfare}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}';
      });
    });
  }

  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
  }

  final Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      // floatingActionButton: CircleAvatar(
      //   child: IconButton(
      //     onPressed: () {
      //       _getCurrentPosition();
      //     },
      //     icon: Icon(
      //       Icons.location_searching,
      //     ),
      //   ),
      // ),
      body: GoogleMap(
        myLocationEnabled: true,
        // myLocationButtonEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: const CameraPosition(
          zoom: 18,
          target: LatLng(0.0, 0.0),
        ),
        markers: _markers.values.toSet(),
        onMapCreated: (GoogleMapController controller) async {
          setState(() {
            final marker = Marker(
              markerId: const MarkerId(
                'Rumah',
              ),
              position: const LatLng(
                -1.1484853875387757,
                116.86297099576815,
              ),
            );
            _markers['Rumah'] = marker;
          });
        },
      ),
    );
  }
}
