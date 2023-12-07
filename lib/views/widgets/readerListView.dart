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
  Duration currentPosition = const Duration();
  Duration lengthDuration = const Duration();
  playAudio(path) async {
    await player.play(AssetSource(path));
  }

  pausePlayer() async {
    await player.pause();
  }

  setUpAudio() {
    player.onPositionChanged.listen((event) {
      setState(() {
        currentPosition = event;
      });
    });
    player.onDurationChanged.listen((event) {
      setState(() {
        lengthDuration = event;
      });
    });
  }

  seekTo(int sec) {
    player.seek(Duration(seconds: sec));
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
                    setUpAudio();
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
            ? Container(
                color: const Color.fromARGB(127, 0, 0, 0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      suraNme,
                      style: const TextStyle(color: textColor, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "${currentPosition.inMinutes.toString().padLeft(2, '0')}:${((currentPosition.inSeconds) % 60).toString().padLeft(2, '0')}"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Slider(
                              activeColor: textColor,
                              value: currentPosition.inSeconds.toDouble(),
                              max: lengthDuration.inSeconds.toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  seekTo(value.toInt());
                                });
                              }),
                        ),
                        Text(
                            "${lengthDuration.inMinutes.toString()}:${((lengthDuration.inSeconds) % 60).toString().padLeft(2, '0')}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (idx > 0) {
                                setState(() {
                                  idx--;
                                  suraNme = widget.reader.content[idx].name;
                                });
                                player.stop;
                                playAudio(widget.reader.content[idx].path);
                                setUpAudio();
                              }
                            },
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
                              isPlay ? Icons.stop : Icons.play_arrow,
                              size: 33,
                            )),
                        IconButton(
                            onPressed: () {
                              if (idx < widget.reader.content.length-1) {
                                setState(() {
                                  idx++;
                                  suraNme = widget.reader.content[idx].name;
                                });
                                player.stop;
                                playAudio(widget.reader.content[idx].path);
                                setUpAudio();
                              }
                            },
                            icon: const Icon(
                              Icons.last_page,
                              size: 33,
                            )),
                      ],
                    ),
                  ],
                ),
              )
            : const Text(""),
      ],
    );
  }
}
