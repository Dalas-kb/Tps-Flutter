import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp2_weather_app/model/current_weather.dart';
import 'package:tp2_weather_app/pages/cherche_page.dart';

import '../api/weather_api.dart';
import '../widgets/bottom_weather.dart';
import '../widgets/current_weather.dart';

class HomePage extends StatefulWidget {
  final WeatherModel? locationWeather;

  const HomePage({Key? key, required this.locationWeather}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WeatherModel> _objWeather;
  late String _city;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      _objWeather = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff00A1FF),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _objWeather = WeatherApi().fetchWeatherModel();
                });
              },
              child: const Icon(
                CupertinoIcons.location_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
            Row(
              children: const [
                Icon(CupertinoIcons.map_fill, color: Colors.white),
                Text(
                  'Weather App',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )
              ],
            ),
            GestureDetector(
              child: const Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 30,
              ),
              onTap: () async {
                var _name = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const CherchePage();
                }));
                if (_name != null) {
                  setState(() {
                    _city = _name;
                    _objWeather = WeatherApi().fetchWeatherModel(
                      city: _city,
                      isCity: true,
                    );
                  });
                }
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherModel>(
            future: _objWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    CurrentWeather(snapshot: snapshot),
                    ButtomView(snapshot: snapshot),
                  ],
                );
              } else {
                return const Center(
                    child: Text(
                  'Ville introuvable\n Veuillez entrer la ville correcte',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
