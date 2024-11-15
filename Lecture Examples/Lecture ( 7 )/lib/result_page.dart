import 'input_page.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constant.dart';

class ResultPage extends StatelessWidget {
ResultPage({required this.Result,required this.BMI,required this.inter});

String Result;
String BMI;
String inter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0D1335),
        appBar: AppBar(
          title: Text("Results Page"),
          backgroundColor: Color(0xFF101639),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Result',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white)
                    ,
                  ),
                )),
            Expanded(
              flex: 5,
              child: ReUseableCard(
                col: Color(0xFF272A4E),
                ChildCard: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        Result,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.green[400],
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        BMI,
                        style: TextStyle(
                            fontSize: 90,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        inter,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),




              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                      child: Text(
                        "Re-CALCULATE",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      )),
                  color: Color(0XFFEB1555),
                  padding: EdgeInsets.only(bottom: 20.0),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: double.infinity,
                  height: 80,
                ),
              ),


          ],
        ));
  }
}