import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/constant/constant.dart';
import 'package:quran_app/model/reader.dart';
import 'package:quran_app/prvider/audioProvider.dart';

class ReaderListView extends StatefulWidget {
  const ReaderListView({super.key, required this.reader});

  final Reader reader;

  @override
  State<ReaderListView> createState() => _ReaderListViewState();
}

class _ReaderListViewState extends State<ReaderListView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);
    
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
                      audioProvider.idx = index;
                      audioProvider.currentAudio =
                          widget.reader.content[index].path;
                    });
                    audioProvider.stopAudio();
                    audioProvider.playAudio();
                    audioProvider.setUpAudio(
                        item: widget.reader.content[index], idx: index);
                    
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
        audioProvider.showBottomContainer
            ? Container(
                color: const Color.fromARGB(127, 0, 0, 0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      audioProvider.suraNme,
                      style: const TextStyle(color: textColor, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "${audioProvider.currentPosition.inMinutes.toString().padLeft(2, '0')}:${((audioProvider.currentPosition.inSeconds) % 60).toString().padLeft(2, '0')}"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Slider(
                              activeColor: textColor,
                              value: audioProvider.currentPosition.inSeconds
                                  .toDouble(),
                              max: audioProvider.lengthDuration.inSeconds
                                  .toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  audioProvider.seekTo(value.toInt());
                                });
                              }),
                        ),
                        Text(
                            "${audioProvider.lengthDuration.inMinutes.toString()}:${((audioProvider.lengthDuration.inSeconds) % 60).toString().padLeft(2, '0')}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (audioProvider.idx > 0 &&
                                  audioProvider.idx <
                                      widget.reader.content.length) {
                                setState(() {
                                  audioProvider.idx--;
                                  audioProvider.suraNme = widget
                                      .reader.content[audioProvider.idx].name;
                                  audioProvider.currentAudio = widget
                                      .reader.content[audioProvider.idx].path;
                                });
                                audioProvider.player.stop;
                                audioProvider.playAudio();
                                audioProvider.setUpAudio(
                                    item: widget
                                        .reader.content[audioProvider.idx],
                                    idx: audioProvider.idx);
                              }
                            },
                            icon: const Icon(
                              Icons.first_page,
                              size: 33,
                            )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                audioProvider.isPlay = !audioProvider.isPlay;
                                if (audioProvider.isPlay) {
                                  audioProvider.playAudio();
                                } else {
                                  audioProvider.pausePlayer();
                                }
                              });
                            },
                            icon: Icon(
                              audioProvider.isPlay
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 33,
                            )),
                        IconButton(
                            onPressed: () {
                              if (audioProvider.idx <
                                  widget.reader.content.length - 1) {
                                setState(() {
                                  audioProvider.idx++;
                                  audioProvider.suraNme = widget
                                      .reader.content[audioProvider.idx].name;
                                  audioProvider.currentAudio = widget
                                      .reader.content[audioProvider.idx].path;
                                });
                                audioProvider.player.stop;
                                audioProvider.playAudio();
                                audioProvider.setUpAudio(
                                    item: widget
                                        .reader.content[audioProvider.idx],
                                    idx: audioProvider.idx);
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
