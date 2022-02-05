import 'package:flutter/material.dart';
import 'package:weatherappmine/models/weather_models.dart';
import 'package:weatherappmine/models/weather_state.dart';
import 'package:weatherappmine/weather_page.dart';
import 'package:rive/rive.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  WeatherModel weatherModel = WeatherModel();
  WeatherState weatherState = WeatherState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var weatherData = await weatherModel.getData();
    //
    int condition = weatherData['weather'][0]['id'];
    weatherState.backGroundImage(condition);
    //
    if (weatherData != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherPage(
          temp: weatherData['main']['temp'],
          wind: weatherData['wind']['speed'],
          desc: weatherData['weather'][0]['description'],
          cityName: weatherData['name'],
          humidity: weatherData['main']['humidity'],
          weatherInfo: weatherData['weather'][0]['main'],
          condition: weatherData['weather'][0]['id'],
          bgImg: weatherState.bgImage,
        );
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RiveAnimation.asset(
          'assets/rive/new_file.riv',
        ),
      ),
    );
  }
}
