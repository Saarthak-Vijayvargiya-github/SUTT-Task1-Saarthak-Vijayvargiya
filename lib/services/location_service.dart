import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:weather_app3/services/models.dart';
import 'package:http/http.dart' as http;

class GetLocationData {
  var latitude;
  var longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch (e) {
      print('error');
    }
  }
}
class DataService2{
  Future<WeatherResponse> dataService2(var latitude,
      var longitude) async {

    final uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=4398f952034a5280f5176707ac1727d8');
    final response = await http.get(uri);

    print(response.body);
    var json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}

