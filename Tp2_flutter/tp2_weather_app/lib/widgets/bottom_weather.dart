import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp2_weather_app/model/current_weather.dart';

import '../api/weather_util.dart';

class ButtomView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

  const ButtomView({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Prévisions météo pour les prochains jours'.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 160,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xff00A1FF).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ModelCard(snapshot, index),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: snapshot.data!.list!.length,
            ),
          )
        ],
      ),
    );
  }
}

Widget ModelCard(AsyncSnapshot snapshot, int index) {
  var modelList = snapshot.data.list;
  var _dayWknd = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(modelList[index].dt * 1000);
  var fullDate = Util.getFormatDate(date);
  _dayWknd = fullDate.split(',')[0]; // Tue
  var tempMin = modelList[index].temp.min.toStringAsFixed(0);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '$tempMin °C',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      Image(
        image: AssetImage(
          Util.TrouveIcon('${modelList[index].weather![0].main}', false),
        ),
        width: 55,
        height: 55,
      ),
      Text(
        _dayWknd,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      )
    ],
  );
}
