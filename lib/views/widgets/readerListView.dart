import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/constant/constant.dart';
import 'package:quran_app/model/reader.dart';

class ReaderListView extends StatefulWidget {
  const ReaderListView({super.key, required this.reader});

  final Reader reader;

  @override
  State<ReaderListView> createState() => _ReaderListViewState();
}

class _ReaderListViewState extends State<ReaderListView> {
  bool isPlay = false;
  int idx = -1;
  bool showBottomContainer = false;
  AudioPlayer player = AudioPlayer();
  String suraNme = "";
  playAudio(path) async {
    await player.play(AssetSource(path));
  }

  pausePlayer() async {
    await player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 380,
          child: ListView.builder(
              itemCount: widget.reader.content.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      suraNme = widget.reader.content[index].name;
                      showBottomContainer = true;
                      isPlay = true;
                      idx = index;
                    });
                    player.stop;
                    playAudio(widget.reader.content[index].path);
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
                      widget.reader.content[index].name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                );
              }),
        ),
        showBottomContainer
            ? bottomContainer()
            : Text(""),
      ],
    );
  }

  Container bottomContainer() {
    return Container(
              color: const Color.fromARGB(127, 0, 0, 0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(suraNme,style: TextStyle(color: textColor,fontSize: 20),),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("00:00"),
                      Slider(value: 1.0, onChanged: (value) {}),
                      const Text("22:10"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.first_page,
                            size: 33,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isPlay = !isPlay;
                              if (isPlay) {
                                playAudio(widget.reader.content[idx].path);
                              } else {
                                pausePlayer();
                              }
                            });
                          },
                          icon: Icon(
                            isPlay ? Icons.play_arrow : Icons.stop,
                            size: 33,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.last_page,
                            size: 33,
                          )),
                    ],
                  ),
                ],
              ),
            );
  }
}
