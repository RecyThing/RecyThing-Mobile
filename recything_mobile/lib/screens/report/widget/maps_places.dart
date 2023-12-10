import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

class MapsPlacesScreen extends StatefulWidget {
  const MapsPlacesScreen({Key? key}) : super(key: key);

  @override
  State<MapsPlacesScreen> createState() => _MapsPlacesScreenState();
}

class _MapsPlacesScreenState extends State<MapsPlacesScreen> {
  TextEditingController _searchController = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = '1234';
  List<dynamic> _placeList = [];
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      onChanged();
    });
  }

  void onChanged() {
    setState(() {
      _sessionToken = uuid.v4();
    });
    getSuggestion(_searchController.text);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "API-KEY";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';

    try {
      Response response = await dio.get(request);

      print('data');
      print(response.data);

      if (response.statusCode == 200) {
        setState(() {
          _placeList = response.data['predictions'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error during Dio request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(hintText: 'Search'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _placeList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        List<Location> locations = await locationFromAddress(
                            _placeList[index]['description']);
                        print(locations.last.latitude);
                        print(locations.last.longitude);
                      },
                      title: Text(_placeList[index]['description']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
