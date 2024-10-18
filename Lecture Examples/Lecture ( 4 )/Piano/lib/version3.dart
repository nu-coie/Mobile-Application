import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class Version3 extends StatefulWidget {
  const Version3({Key? key}) : super(key: key);

  @override
  _Version3State createState() => _Version3State();
}

class _Version3State extends State<Version3> {
  void playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$noteNumber.wav'));
  }

  Expanded buildKey(int sound, Color color) {
    return Expanded(

      child: TextButton(
          onPressed: () {
            playSound(sound);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: color,
          ),
          child: Text(" ")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(1, Colors.black),
            buildKey(2, Colors.white),
            buildKey(3, Colors.black),
            buildKey(4, Colors.white),
            buildKey(5, Colors.black),
            buildKey(6, Colors.white),
            buildKey(7, Colors.black)
          ],
        ),
      ),
    );
  }
}