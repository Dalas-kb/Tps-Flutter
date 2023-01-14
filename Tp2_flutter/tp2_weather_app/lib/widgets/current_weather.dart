import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:tp2_weather_app/model/current_weather.dart';

import '../api/weather_util.dart';
import 'extra_weather.dart';

class CurrentWeather extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

  const CurrentWeather({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data;
    var modelList = data!.list!;
    var temp = modelList[0].dtTxt!.toString();
    var formatDate =
        DateTime.fromMillisecondsSinceEpoch(modelList[0].dt! * 1000);

    return GlowContainer(
      height: MediaQuery.of(context).size.height - 230,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: const Color(0xff00A1FF).withOpacity(0.5),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      color: const Color(0xff00A1FF),
      spreadRadius: 5,
      child: Column(
        children: [
          GlowText(
            data.city!.name!,
            style: const TextStyle(
              height: 0.1,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 430,
            child: Stack(
              children: [
                Image(
                  image: AssetImage(
                    Util.TrouveIcon('${modelList[0].weather![0].main}', true),
                  ),
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Column(
                      children: [
                        GlowText(
                          '$temp °C',
                          style: const TextStyle(
                            height: 0.1,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${modelList[0].weather![0].description}',
                          style: const TextStyle(fontSize: 25),
                        ),
                        Text(
                          Util.getFormatDate(formatDate),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(color: Colors.white),
          const SizedBox(height: 10),
          ExtraWeather(snapshot: snapshot),
        ],
      ),
    );
  }
}
