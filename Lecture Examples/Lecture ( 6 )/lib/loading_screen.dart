import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';
import 'weathermodel.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    GetLoc();

  }

  Future<dynamic> GetLoc() async
  {
    WeatherModel obj =  new WeatherModel();
    var weathermodel = await obj.OpenWeatherMap();

    Timer(Duration(seconds: 2),(){
      // Try Home_PageV2
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(WeatherData: weathermodel)));
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF97bddb),
        body: Center(
          child: Container(
            width: double.infinity,
            color: Color(0xFF97bddb),
            child: Center(child: Image.asset('images/splashscreen.gif')),
          ),
        ));
  }
}

