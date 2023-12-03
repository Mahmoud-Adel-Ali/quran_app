// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quran_app/constant/constant.dart';

class ReaderContent extends StatelessWidget {
  const ReaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              // SizedBox(height: 44),
              Row(
                children: [
                  CircleAvatar(
                    radius: 55,
                    // backgroundColor: textColor,
                    backgroundImage: AssetImage(
                      'assets/img/islam.jpeg',
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.10),
                  Text(
                    "islam sobhi   اسلام صبحي",
                    style: TextStyle(color: textColor, fontSize: 22),
                  ),
                ],
              ),
              SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height - 240,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Text(
                          "سوره ق",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w800),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
