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
import 'package:recything_mobile/services/map_service.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
// import 'package:flutter_google_places/flutter_google_places.dart' as loc;
// import 'package:google_api_headers/google_api_headers.dart' as header;
// import 'package:google_maps_webservice/places.dart' as places;

class MapsReportScreen extends StatefulWidget {
  final String reportType;
  const MapsReportScreen({Key? key, required this.reportType})
      : super(key: key);

  @override
  State<MapsReportScreen> createState() => _MapsReportScreenState();
}

class _MapsReportScreenState extends State<MapsReportScreen> {
  TextEditingController _searchController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  // GoogleMapController? _controller;
  // Location location = Location(latitude: null, longitude: null, timestamp: null);

  Position? _currentPosition;
  String? _currentAddress;
  MarkerId? _selectedMarkerId;

  // getCurrentLocation() async {
  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return;
  //     }
  //   }

  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
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
            builder: (context) => const PelanggaranKecilScreen(),
          ),
        );
      } else if (widget.reportType == 'pelanggaran-besar') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const PelanggaranBesarScreen(),
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

//     Future<void> _handleSearch() async {
//       places.Prediction? p = await loc.PlacesAutocomplete.show(
//           context: context,
//           apiKey: 'AIzaSyAygD-3hvHHwBjAYzw_NIzkZR6-cshy-zs',
//           onError: onError, // call the onError function below
//           mode: loc.Mode.overlay,
//           language: 'en', //you can set any language for search
//           strictbounds: false,
//           types: [],
//           decoration: InputDecoration(
//               hintText: 'search',
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   borderSide: const BorderSide(color: Colors.white))),
//           components: [] // you can determine search for just one country
//           );

//       // displayPrediction(p!, homeScaffoldKey.currentState);
//     }

//     void onError(places.PlacesAutocompleteResponse response) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         elevation: 0,
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: Colors.transparent,
//         content: SnackBar(
//           content: Text('Error'),
//           // title: 'Message',
//           // message: response.errorMessage!,
//           // contentType: ContentType.failure,
//         ),
//       ));
//     }

//     Future<void> displayPrediction(
//         places.Prediction p, ScaffoldState? currentState) async {
//       places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(
//           apiKey: 'AIzaSyAygD-3hvHHwBjAYzw_NIzkZR6-cshy-zs ',
//           apiHeaders: await const header.GoogleApiHeaders().getHeaders());
//       places.PlacesDetailsResponse detail =
//           await _places.getDetailsByPlaceId(p.placeId!);
// // detail will get place details that user chose from Prediction search
//       final lat = detail.result.geometry!.location.lat;
//       final lng = detail.result.geometry!.location.lng;
//       _markers.clear(); //clear old marker and set new one
//       final marker = Marker(
//         markerId: const MarkerId('deliveryMarker'),
//         position: LatLng(lat, lng),
//         infoWindow: const InfoWindow(
//           title: '',
//         ),
//       );
//       setState(() {
//         _markers['myLocation'] = marker;
//         _controller?.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(target: LatLng(lat, lng), zoom: 15),
//           ),
//         );
//       });
//     }

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
            const Positioned(
              top: 13,
              left: 16,
              child: CustomBackButton(),
            ),
            const SizedBox(
              width: 9,
            ),
            // Row(children: [Expanded(child: TextFormField(controller: _searchController, decoration: InputDecoration(),))]),
            Positioned(
              top: 13,
              left: 81, right: 30,
              // right: 16,
              child: TextFieldReport(
                controller: _searchController,
                prefixIcon: IconlyLight.search,
                hintText: 'Cari disini',
                onChanged: (value) {
                  LocationService().getPlaceId(_searchController.text);
                },
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
// }
