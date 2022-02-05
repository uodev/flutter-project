import 'package:flutter/material.dart';
import 'package:weatherappmine/constans/constants.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage(
      {Key? key,
      required this.temp,
      required this.wind,
      required this.desc,
      required this.cityName,
      required this.humidity,
      required this.weatherInfo,
      required this.condition,
      required this.bgImg})
      : super(key: key);
  final double temp;
  final double wind;
  final String desc;
  final String cityName;
  final int humidity;
  final String weatherInfo;
  final int condition;
  final String bgImg;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/${widget.bgImg}.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                      child: Text(
                        widget.cityName.toUpperCase(),
                        style: kCityNameTextStlye,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            top: 20.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                widget.temp.toStringAsFixed(0),
                                style: kTempTextStyle,
                              ),
                              const Text(
                                '°',
                                style: kTempIconTextStyle,
                              ),
                            ],
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: -1,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20.0, left: 50.0),
                            child: Text(
                              widget.desc,
                              style: kDecsTextStlye,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Wind',
                            style: kInfoTextStyle,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            widget.wind.toStringAsFixed(0),
                            style: kInfoTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Humidity',
                            style: kInfoTextStyle,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            widget.humidity.toString(),
                            style: kInfoTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Weather',
                            style: kInfoTextStyle,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            widget.weatherInfo,
                            style: kInfoTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
