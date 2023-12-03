// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quran_app/constant/constant.dart';
import 'package:quran_app/views/widgets/listViewChild.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quran App",
          style: TextStyle(
              fontSize: 27, color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: Text(
                "قُرّآءْ اَلْمُصْحَفْ",
                style: TextStyle(
                    fontSize: 25,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 222,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return const ListViewChild();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
