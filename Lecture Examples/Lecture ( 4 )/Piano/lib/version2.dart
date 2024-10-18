import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class Version2 extends StatefulWidget {
  const Version2({Key? key}) : super(key: key);

  @override
  _Version2State createState() => _Version2State();
}

class _Version2State extends State<Version2> {

  void playSound(int noteNumber)
  {
    final player = AudioPlayer();
    player.play(AssetSource('note$noteNumber.wav'));
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
            Expanded(
              child: TextButton(

                  onPressed:(){
                    playSound(1);
                  },
                  child: Container(color: Colors.black,

                  )),
            ),

            Expanded(
              child: TextButton(

                  onPressed:(){
                    playSound(2);
                  },
                  child: Container(color: Colors.white,

                  )),
            ),

            Expanded(
              child: TextButton(

                  onPressed:(){
                    playSound(3);
                  },
                  child: Container(color: Colors.black,

                  )),
            ),


            Expanded(
              child: TextButton(

                  onPressed:(){
                    playSound(4);
                  },
                  child: Container(color: Colors.white,

                  )),
            ),


            Expanded(
              child: TextButton(

                  onPressed:(){
                    playSound(5);
                  },
                  child: Container(color: Colors.black,

                  )),
            ),
            Expanded(
              child: TextButton(

                  onPressed:(){
                    playSound(6);
                  },
                  child: Container(color: Colors.white,

                  )),
            ),
            Expanded(
              child: TextButton(

                  onPressed:(){
                    playSound(7);
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