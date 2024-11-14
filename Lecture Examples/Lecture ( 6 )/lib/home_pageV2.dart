import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constant.dart';
import 'city_page.dart';
import 'weathermodel.dart';
import 'package:intl/intl.dart';

WeatherModel Weather = new WeatherModel();
class HomePage extends StatefulWidget
{
  HomePage({required this.WeatherData});

  final WeatherData;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isTextFieldVisible = false;
  TextEditingController cityController = TextEditingController();
  late int condition = 10;
  late double tempreature = 22.0;
  late String cityName = 'Null';
  late double speed = 0.0;
  late int humidity = 0;
  late String ConditionEmoji = '🌨️';
  late String Message = '';

  late int unixTimestamp ;

  late String dayName = 'Tuesday';
  late String md = 'Nov 13';
  late String time = '09:15';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUI(widget.WeatherData);
  }

  void UpdateUI(dynamic weather)

  {
    setState(() {
      cityName = weather['name'];
      condition = weather['weather'][0]['id'];
      var lat = weather['coord']['lat'];
      tempreature = weather['main']['temp'];

      cityName = weather['name'];

      unixTimestamp = weather['timezone'];
      humidity = weather['main']['humidity'];
      speed = weather['wind']['speed'];

      ConditionEmoji = Weather.getWeatherIcon(condition);


      // In below Part we will extract the values of Day/Month/Time
      var timezoneOffsetInSeconds = weather['dt']; // Offset in seconds from the API
      final dateTime = DateTime.fromMillisecondsSinceEpoch(timezoneOffsetInSeconds * 1000);
      // Format the DateTime
      dayName = DateFormat('EEEE').format(dateTime); // Day of the week
      md = DateFormat('dd MMM.').format(dateTime); // Month and day
      time = DateFormat('HH:mm').format(dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.gif'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
//----------------------------- NavBar Buttons -------------------------------------
                  TextButton(
                    onPressed: () async  {
                      var weather = await Weather.OpenWeatherMap();
                      UpdateUI(weather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {

                        isTextFieldVisible = true;

                      });
                    },
                    child: Icon(
                      Icons.search_rounded,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              if (isTextFieldVisible)
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: cityController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () async {
                          var city = cityController.text;
                          // Fetch weather data
                          var weatherm = await Weather.OpenWeatherCity(city);
                          if(weatherm != null) {
                            UpdateUI(weatherm);
                          }
                          setState(() {
                            isTextFieldVisible = false;
                          });
                        },
                      ),
                    ),
                  ),
                ),

//----------------------------- Recommendation  & City Name  ----------------------------------------------

              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
//----------------------------- Temperature ----------------------------------------------

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '${tempreature.toInt()}°',
                      style: kTempTextStyle,
                    ),

//----------------------------- Temperature Icon----------------------------------------------

                    Text(
                      '$ConditionEmoji',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),

//----------------------------- Date ( Day Name | Mon Day | Time ) ----------------------------------------------
              Text(
                '$dayName | $md | $time',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
//-----------------------------Divider----------------------------------------------
              Divider(color: Colors.white),

//-----------------------------Wind Speed  | humidity----------------------------------------------

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.wind,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        speed.toString(),
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.gauge,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '1.0 m/s',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.droplet,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        humidity.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}