import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("First App"),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/dash.png'),
        ),
      ),
    ),

    /*

    Using Network Asset

      body: Center(
          child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/4/4f/Dash%2C_the_mascot_of_the_Dart_programming_language.png'),)),
    ),


     */
  ));
}
