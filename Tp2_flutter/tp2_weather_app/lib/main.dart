import 'package:flutter/material.dart';
import 'package:tp2_weather_app/pages/home_page.dart';
import 'package:tp2_weather_app/pages/location_page.dart';
import 'package:tp2_weather_app/pages/cherche_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LocationPage(),
    );
  }
}
