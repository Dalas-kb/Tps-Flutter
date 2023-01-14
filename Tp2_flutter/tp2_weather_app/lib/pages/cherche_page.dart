import 'package:flutter/material.dart';

class CherchePage extends StatefulWidget {
  const CherchePage({Key? key}) : super(key: key);

  @override
  State<CherchePage> createState() => _CherchePageState();
}

class _CherchePageState extends State<CherchePage> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: 70,
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Entrez la ville',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color(0xff00A1FF).withOpacity(0.5),
                ),
                onChanged: (value) => cityName = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(
                    'Recherche',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff00A1FF).withOpacity(0.5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
