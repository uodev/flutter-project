import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherappmine/loading_page.dart';
import 'package:weatherappmine/weather_page.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
