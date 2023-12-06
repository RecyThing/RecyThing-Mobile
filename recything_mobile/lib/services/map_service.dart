import 'package:dio/dio.dart';
import 'dart:convert';

class LocationService {
  Dio dio = Dio();
  final String key = 'API-KEY';

  Future<String?> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$key';

    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        var responseData = response.data;

        if (responseData != null && responseData.containsKey('candidates')) {
          var candidates = responseData['candidates'] as List<dynamic>;

          if (candidates.isNotEmpty) {
            var placeId = candidates[0]['place_id'] as String;
            return placeId;
          } else {
            print('No candidates found');
            return null;
          }
        } else {
          print('Invalid response format: $responseData');
          return null;
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error during API request: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getPlace(String input) async {
    final placeId = await getPlaceId(input);

    if (placeId != null) {
      final String url =
          'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

      try {
        var response = await dio.get(url);

        if (response.statusCode == 200) {
          var results =
              json.decode(response.data)['result'] as Map<String, dynamic>;

          print(results);
          return results;
        } else {
          print('Request failed with status: ${response.statusCode}');
          return null;
        }
      } catch (error) {
        print('Error during API request: $error');
        return null;
      }
    } else {
      return null;
    }
  }
}
