import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain obj = new QuizBrain();

class Version1 extends StatefulWidget {
  const Version1({Key? key}) : super(key: key);

  @override
  _Version1State createState() => _Version1State();
}

class _Version1State extends State<Version1> {
  List<Icon> score = [];

  void displayIcon(bool answer) {
    if (obj.EndofQuiz()) {
      bool correctAnswer = obj.GetAnswers();

      if (correctAnswer == answer)
      {
        score.add(Icon(
          FontAwesomeIcons.check,
          color: Colors.green,
        ),);
      }
      else
      {
        score.add(Icon(
          FontAwesomeIcons.xmark,
          color: Colors.red,
        ));
      }



      setState(() {
        obj.nextQuestion();
      });
    }
    else
    {

      Alert(
        context: context,
        title: "Quiz Completed 🎉",
        desc: "Congratulations! You've finished the quiz. Well done! 🏆",
      ).show();

//////////////  🚨🚨🚨🚨🚨 //////////////////
// You can customize this alert message and button as below
    /*
      Alert(
        context: context,
        type: AlertType.success,
        title: "Quiz Completed 🎉",
        desc: "Congratulations! You've finished the quiz. Well done! 🏆",
        buttons: [
          DialogButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),

          ),
        ],
      ).show();

*/
//////////////  🚨🚨🚨🚨🚨 //////////////////

      setState(() {
        score = [];
        obj.resetQ();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF17145E),
        appBar: AppBar(
          backgroundColor: Color(0xFF17145E),
          title: Text(
            'Quiz App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
          leading: Icon(
            FontAwesomeIcons.bars,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                        child: Text(
                      obj.GetQuestion(),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    displayIcon(true);
                  },
                  child: Center(
                      child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  )),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                     displayIcon(false);
                  },
                  child: Center(
                      child: Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  )),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: score,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
