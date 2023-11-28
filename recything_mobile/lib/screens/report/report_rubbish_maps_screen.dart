import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ReportRubbishMapsScreen extends StatefulWidget {
  const ReportRubbishMapsScreen({super.key});

  @override
  State<ReportRubbishMapsScreen> createState() =>
      _ReportRubbishMapsScreenState();
}

class _ReportRubbishMapsScreenState extends State<ReportRubbishMapsScreen> {
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
        const SnackBar(
          content: Text(
              'Izin lokasi ditolak. Aktifkan izin di pengaturan aplikasi.'),
        ),
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Izin lokasi ditolak secara permanen. Buka pengaturan aplikasi untuk mengaktifkan izin.'),
        ),
      );
    } else if (status == PermissionStatus.granted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
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

  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission(context);

  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   ).then(
  //     (Position position) {
  //       setState(
  //         () {
  //           _currentPosition = position;
  //         },
  //       );
  //     },
  //   );
  // }

  // Future<bool> _handleLocationPermission(BuildContext context) async {
  //   bool serviceEnabled;
  //   LocationPermission locationPermission;

  //   // cek apakah gps aktif atau tidak
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   print(serviceEnabled);

  //   if (!serviceEnabled) {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text(
  //             'GPS tidak aktif, silahkan aktifkan terlebih dahulu',
  //           ),
  //         ),
  //       );
  //     }
  //     return false;
  //   }

  //   locationPermission = await Geolocator.checkPermission();
  //   print(locationPermission);

  //   if (locationPermission == LocationPermission.denied) {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text(
  //             'Anda belum mengaktifkan izin lokasi di aplikasi anda',
  //           ),
  //         ),
  //       );
  //     }
  //     return false;
  //   }

  //   if (locationPermission == LocationPermission.deniedForever) {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text(
  //             'Anda perlu mengaktifkan izin lewat izin hp anda',
  //           ),
  //         ),
  //       );
  //     }
  //     return false;
  //   }

  //   return true;
  // }

  // @override
  // void initState() {
  //   requestPermission();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude: ${_currentPosition?.latitude ?? "-"}'),
            Text('Longitude: ${_currentPosition?.longitude ?? "-"}'),
            Text('Address: ${_currentAddress ?? "-"}'),
            ElevatedButton(
              onPressed: () async {
                await _getCurrentPosition();
                // back ke halaman report rubbish
                // Navigator.pop(context, _currentAddress);
              },
              child: const Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
