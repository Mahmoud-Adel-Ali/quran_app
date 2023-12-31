
import 'package:flutter/material.dart';
import 'package:quran_app/constant/constant.dart';
import 'package:quran_app/model/reader.dart';
import 'package:quran_app/views/widgets/readerListView.dart';

class ReaderContent extends StatefulWidget {
  const ReaderContent({super.key, required this.reader});
  final Reader reader;
  @override
  State<ReaderContent> createState() => _ReaderContentState();
}

class _ReaderContentState extends State<ReaderContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // SizedBox(height: 44),
              Row(
                children: [
                  CircleAvatar(
                    radius: 55,
                    // backgroundColor: textColor,
                    backgroundImage: AssetImage(
                      widget.reader.img,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.10),
                  Text(
                    widget.reader.name,
                    style: const TextStyle(color: textColor, fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              ReaderListView(reader: widget.reader,)
            ],
          ),
        ),
      ),
    );
  }
}
