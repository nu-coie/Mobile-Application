import 'dart:convert';
import 'dart:async';
import 'locationService.dart';
import 'package:http/http.dart' as http;

late String date;


class WeatherModel
{


  Future<dynamic> OpenWeatherCity(dynamic cityname) async
  {
    LocationService obj = await new LocationService();
    await obj.GetLocation();
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=abe6f24f2d68edde13d556d363c0be58&units=metric'));
    if(response.statusCode == 200)
    {
      date = response.body;

      print(date);
      return jsonDecode(date);
    }
    else
    {

      return response.statusCode;
    }
  }

  Future<dynamic> OpenWeatherMap() async
  {
    LocationService obj = await new LocationService();
    await obj.GetLocation();
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${obj.latitude}&lon=${obj.longitude}&appid=abe6f24f2d68edde13d556d363c0be58&units=metric'));
    if(response.statusCode == 200)
    {
      date = response.body;

      print(date);
      return jsonDecode(date);
    }
    else
    {

      return response.statusCode;
    }
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}