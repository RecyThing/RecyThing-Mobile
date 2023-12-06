// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconly/iconly.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/report/report-rubbish/report_rubbish_screen.dart';
import 'package:recything_mobile/screens/report/report_littering/pelanggaran_besar_screen.dart';
import 'package:recything_mobile/screens/report/report_littering/pelanggaran_kecil_screen.dart';
import 'package:recything_mobile/screens/report/widget/main_button_widget.dart';
import 'package:recything_mobile/screens/report/widget/text_field_report.dart';

class MapsReportScreen extends StatefulWidget {
  final String reportType;
  const MapsReportScreen({Key? key, required this.reportType})
      : super(key: key);

  @override
  State<MapsReportScreen> createState() => _MapsReportScreenState();
}

class _MapsReportScreenState extends State<MapsReportScreen> {
  Completer<GoogleMapController> _controller = Completer();

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

        if (_controller.isCompleted) {
          final controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(position.latitude, position.longitude),
            ),
          );
        }
      } catch (e) {
        // print('Error getting location: $e');
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
        _updateMarker(position);
      });
    });
  }

  Future<void> _updateAddress() async {
    if (_currentPosition != null) {
      await _getAddress(_currentPosition!);

      Navigator.of(context).pop();
      if (widget.reportType == 'rubbish') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ReportRubbishScreen(
              locationAddress: _currentAddress,
            ),
          ),
        );
      } else if (widget.reportType == 'pelanggaran-kecil') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LitteringKecilScreen(),
          ),
        );
      } else if (widget.reportType == 'pelanggaran-besar') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LitteringBesarScreen(),
          ),
        );
      } else if (widget.reportType == 'littering') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LitteringKecilScreen(
              locationAddress: _currentAddress,
              latitude: _currentPosition?.latitude.toString(),
              longitude: _currentPosition?.longitude.toString(),
            ),
          ),
        );
      } else if (widget.reportType == 'littering-besar') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LitteringBesarScreen(
              locationAddress: _currentAddress,
              latitude: _currentPosition?.latitude.toString(),
              longitude: _currentPosition?.longitude.toString(),
            ),
          ),
        );
      }
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
      );
      _markers['CurrentLocation'] = marker;
    });
  }

  void _selectMarker(String markerId) {
    setState(() {
      _selectedMarkerId = MarkerId(markerId);
    });
  }

  void _goToCurrentPosition() {
    _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(
            _currentPosition?.latitude ?? 0.0,
            _currentPosition?.longitude ?? 0.0,
          ),
        ),
      );
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
      // appBar: AppBar(
      //   leading: const Padding(
      //     padding: EdgeInsets.only(left: 16),
      //     child: CustomBackButton(),
      //   ),
      //   title: const Padding(
      //     padding: EdgeInsets.only(right: 16),
      //     child: SizedBox(
      //       width: 263,
      //       height: 56,
      //       child: TextFieldReport(
      //         prefixIcon: IconlyLight.search,
      //         hintText: 'Cari disini',
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              // myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: _currentPosition != null
                  ? CameraPosition(
                      zoom: 18,
                      target: LatLng(
                        _currentPosition!.latitude,
                        _currentPosition!.longitude,
                      ),
                    )
                  : const CameraPosition(target: LatLng(0.0, 0.0), zoom: 18),

              markers: _markers.values.toSet(),
              onTap: (LatLng position) {
                _selectMarker('');
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              top: 13,
              left: 16,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Pallete.dark2,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      IconlyLight.arrow_left,
                      size: 24.0,
                      color: Pallete.dark1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            const Positioned(
              top: 13,
              left: 81,
              right: 16,
              child: TextFieldReport(
                prefixIcon: IconlyLight.search,
                hintText: 'Cari disini',
              ),
            ),
            Positioned(
                bottom: 24,
                left: 16,
                right: 16,
                child: MainButtonWidget(
                    onPressed: () {
                      _updateAddress();
                    },
                    child: Text(
                      'Selanjutnya',
                      style:
                          ThemeFont.heading6Bold.copyWith(color: Colors.white),
                    ))),
            Positioned(
              bottom: 96,
              right: 16,
              child: SizedBox(
                width: 48,
                height: 48,
                child: FloatingActionButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  onPressed: () {
                    if (_currentPosition != null) {
                      _goToCurrentPosition();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Current position is not available.'),
                        ),
                      );
                    }
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.my_location,
                    color: Pallete.main,
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
