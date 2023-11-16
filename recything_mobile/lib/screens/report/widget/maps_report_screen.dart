import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/report-rubbish/report_rubbish_screen.dart';

class MapsReportScreen extends StatefulWidget {
  const MapsReportScreen({Key? key}) : super(key: key);

  @override
  State<MapsReportScreen> createState() => _MapsReportScreenState();
}

class _MapsReportScreenState extends State<MapsReportScreen> {
  Position? _currentPosition;
  String? _currentAddress;
  MarkerId? _selectedMarkerId;

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
        _updateMarker(position);
      });
    });
  }

  Future<void> _updateAddress() async {
    if (_currentPosition != null) {
      await _getAddress(_currentPosition!);

      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ReportRubbishScreen(
            locationAddress: _currentAddress,
          ),
        ),
      );
    }
  }

  void _updateMarker(Position position) {
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: const MarkerId('CurrentLocation'),
        position: LatLng(position.latitude, position.longitude),
        onTap: () {
          _selectMarker('CurrentLocation');
        },
        // infoWindow: const InfoWindow(title: 'Current Location'),
      );
      _markers['CurrentLocation'] = marker;
    });
  }

  void _selectMarker(String markerId) {
    setState(() {
      _selectedMarkerId = MarkerId(markerId);
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
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: _currentPosition != null
                    ? LatLng(
                        _currentPosition!.latitude, _currentPosition!.longitude)
                    : LatLng(0.0, 0.0),
              ),
              markers: _markers.values.toSet(),
              onTap: (LatLng position) {
                _selectMarker('');
              },
              onMapCreated: (GoogleMapController controller) async {
                // if (_currentPosition != null) {
                //   _updateMarker(_currentPosition!);
                // }
              },
            ),
            Positioned(
              bottom: 24,
              left: 16,
              right: 16,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.main,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
                onPressed: () {
                  _updateAddress();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Selanjutnya',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
