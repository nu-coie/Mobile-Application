import 'package:http/http.dart';
import 'dart:convert';


class CoinAPi
{
  Future<dynamic> GetExchangeRate(String crypto,String curn) async
  {
    String _apiKey = 'E20847AB-23E0-4F01-A2DB-EE91FC87674A';
    Response response = await get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$crypto/$curn?apikey=${_apiKey}'));

    if(response.statusCode == 200)
      {
        return jsonDecode(response.body)['rate'];
      }
    else
      {
        print("Error ..");
      }
  }
}