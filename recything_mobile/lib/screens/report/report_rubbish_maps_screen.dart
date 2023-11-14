import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ReportRubbishMapsScreen extends StatefulWidget {
  const ReportRubbishMapsScreen({super.key});

  @override
  State<ReportRubbishMapsScreen> createState() =>
      _ReportRubbishMapsScreenState();
}

class _ReportRubbishMapsScreenState extends State<ReportRubbishMapsScreen> {
  Position? _currentPosition;

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission(context);

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then(
      (Position position) {
        setState(
          () {
            _currentPosition = position;
          },
        );
      },
    );
  }

  Future<bool> _handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    // cek apakah gps aktif atau tidak
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);

    if (!serviceEnabled) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'GPS tidak aktif, silahkan aktifkan terlebih dahulu',
            ),
          ),
        );
      }
      return false;
    }

    locationPermission = await Geolocator.checkPermission();
    print(locationPermission);

    if (locationPermission == LocationPermission.denied) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Anda belum mengaktifkan lokasi di aplikasi anda',
            ),
          ),
        );
      }
      return false;
    }

    if (locationPermission == LocationPermission.deniedForever) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Anda perlu mengaktifkan izin lewat izin hp anda',
            ),
          ),
        );
      }
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude: ${_currentPosition?.latitude ?? "-"}'),
            Text('Longitude: ${_currentPosition?.longitude ?? "-"}'),
            ElevatedButton(
              onPressed: () {
                _getCurrentPosition();
              },
              child: Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
