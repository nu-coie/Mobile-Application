import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Version1 extends StatefulWidget {
  const Version1({Key? key}) : super(key: key);

  @override
  _Version1State createState() => _Version1State();
}

class _Version1State extends State<Version1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(

                  onPressed:(){
                    final player = AudioPlayer();
                    player.play(AssetSource('note1.wav'));
                  },
                  child: Container(color: Colors.black,

                  )),
            ),

            Expanded(
              child: TextButton(

                  onPressed:(){
                    final player = AudioPlayer();
                    player.play(AssetSource('note2.wav'));
                  },
                  child: Container(color: Colors.white,

                  )),
            ),

            Expanded(
              child: TextButton(

                  onPressed:(){
                    final player = AudioPlayer();
                    player.play(AssetSource('note3.wav'));
                  },
                  child: Container(color: Colors.black,

                  )),
            ),


            Expanded(
              child: TextButton(

                  onPressed:(){
                    final player = AudioPlayer();
                    player.play(AssetSource('note4.wav'));
                  },
                  child: Container(color: Colors.white,

                  )),
            ),


            Expanded(
              child: TextButton(

                  onPressed:(){
                    final player = AudioPlayer();
                    player.play(AssetSource('note5.wav'));
                  },
                  child: Container(color: Colors.black,

                  )),
            ),

            Expanded(
              child: TextButton(

                  onPressed:(){
                    final player = AudioPlayer();
                    player.play(AssetSource('note4.wav'));
                  },
                  child: Container(color: Colors.white,

                  )),
            ),


            Expanded(
              child: TextButton(

                  onPressed:(){
                    final player = AudioPlayer();
                    player.play(AssetSource('note5.wav'));
                  },
                  child: Container(color: Colors.black,

                  )),
            ),
          ],
        ),
      ),
    );
  }
}