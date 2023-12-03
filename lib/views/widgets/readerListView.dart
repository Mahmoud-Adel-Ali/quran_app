
import 'package:flutter/material.dart';

class ReaderListView extends StatelessWidget {
  const ReaderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              );
  }
}