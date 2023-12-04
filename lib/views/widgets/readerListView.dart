
import 'package:flutter/material.dart';
import 'package:quran_app/model/reader.dart';

class ReaderListView extends StatefulWidget {
  const ReaderListView({super.key, required this.reader});

  final Reader reader;

  @override
  State<ReaderListView> createState() => _ReaderListViewState();
}

class _ReaderListViewState extends State<ReaderListView> {
  bool onPressed = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 240,
      child: ListView.builder(
          itemCount: widget.reader.content.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((context) {
                    return Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/img/makka.jpg",
                            ),
                          ),
                          ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            widget.reader.name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 27,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    );
                  }),
                );
              },
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.all(5),
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  widget.reader.content[index],
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ),
            );
          }),
    );
  }
}
