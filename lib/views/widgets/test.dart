import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  AudioPlayer player = AudioPlayer();
  bool isPlay = false;
  Duration currentPosition = const Duration();
  Duration lengthDuration = const Duration();
  playAudio() {
    player.play(AssetSource('audio/islam/سورة النمل  _ اسلام ص.mp3'));
  }

  setUpAudio() {
    player.onPositionChanged.listen((event) {
      // currentPosition = event;
      setState(() {
        currentPosition = event;
      });
    });
    player.onDurationChanged.listen((event) {
      // lengthDuration = event;
      setState(() {
        lengthDuration = event;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // playAudio();
    // player.stop();
    setUpAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${currentPosition.inMinutes.toString()}:${((currentPosition.inSeconds) % 60)}",
                    style: TextStyle(fontSize: 30),
                  ),
                  Slider(
                    value: currentPosition.inSeconds.toDouble(),
                    max: lengthDuration.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        player.seek(Duration(seconds: value.toInt()));
                      });
                    },
                  ),
                  Text(
                    "${lengthDuration.inMinutes}:${lengthDuration.inSeconds % 60}",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isPlay = !isPlay;
                      if (!isPlay) {
                        player.pause();
                        // setUpAudio();
                      } else {
                        playAudio();
                      }
                    });
                  },
                  icon: isPlay ? Icon(Icons.pause) : Icon(Icons.play_arrow))
            ],
          ),
        ),
      ),
    );
  }
}
