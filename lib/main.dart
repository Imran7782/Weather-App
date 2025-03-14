import 'package:flutter/material.dart';
import 'package:weather/Loading.dart';

void main(){
  runApp(MyWeatherApp());

}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: LoadingScreen()
    );
  }
}