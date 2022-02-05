import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherappmine/models/location.dart';

const apiKey = '21b9a2df41d204afc5aabd8189f8c5f4';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future getData() async {
    Location location = Location();
    await location.getLocationData();
    var url =
        '$openWeatherURL&lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
