import 'package:flutter/material.dart';
import 'API_Service.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

CoinAPi obj = new CoinAPi();

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
String selectedValue ="USD";

/*
double exchageRate = 0.0;
double exchageRate2 = 0.0;
double exchageRate3 = 0.0;
*/

Map<String,String> exchangeRates = {
  'BTC':'Loading ...',
  'ETH':'Loading ...',
  'LTC':'Loading ...'
};

Future<void> fetchData () async
{
  Map<String,String> newExchange ={};
  
  for(String Keys in exchangeRates.keys)
    {
      final rate = await obj.GetExchangeRate(Keys,selectedValue);
      newExchange[Keys]=rate.toString();
    }
  setState(() {
    exchangeRates = newExchange;

  });
}

  /*Future<void> fetchData () async
  {
    final rate = await obj.GetExchangeRate('BTC',selectedValue);
    final rate2 = await obj.GetExchangeRate('ETH',selectedValue);
    final rate3 = await obj.GetExchangeRate('LTC',selectedValue);
    setState(() {
      exchageRate = rate;
      exchageRate2 = rate2;
      exchageRate3 = rate3;
    });
  }
*/

  Widget DropDownMen()
  {
    List<DropdownMenuItem> newDropDownMenu =[];

    for(String cur in currenciesList)
      {
     var x= DropdownMenuItem(child: Text(cur),value: cur,);
     newDropDownMenu.add(x);
      }
    return DropdownButton(
        value: selectedValue,
        items:  newDropDownMenu,
        onChanged: (value){
          setState(() {
            selectedValue = value.toString();
          });
          fetchData();
        });
  }

  Widget CupertinoText()
  {
    List<Text> newCupertinoText =[];
  for(int i=0;i<currenciesList.length;i++)
    {
      var y = Text(currenciesList[i]);
       newCupertinoText.add(y);
    }
  return CupertinoPicker(itemExtent: 30, onSelectedItemChanged: (value){
    setState(() {
      selectedValue = currenciesList[value];
    });
    fetchData();

  }, children: newCupertinoText);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData ();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Exchange'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [


            //BTC
          ExchangeRateCard(cryptoName:'BTC',exchangeRates: exchangeRates, selectedValue: selectedValue),
           //ETH
          ExchangeRateCard(cryptoName:'ETH',exchangeRates: exchangeRates, selectedValue: selectedValue),
          //LTC
          ExchangeRateCard(cryptoName:'LTC',exchangeRates: exchangeRates, selectedValue: selectedValue),


          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))),
            child:(Platform.isIOS)?CupertinoText():DropDownMen()
          ),
        ],
      ),
    );
  }
}

class ExchangeRateCard extends StatelessWidget {
  const ExchangeRateCard({
    super.key,
    required this.cryptoName,
    required this.exchangeRates,
    required this.selectedValue,
  });

  final Map<String, String> exchangeRates;
  final String selectedValue;
  final String cryptoName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 cryptoName = ${exchangeRates[cryptoName]} $selectedValue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
/*

DropdownButton(
value: selectedValue,
items:  DropDownMen(),
onChanged: (value){
setState(() {
selectedValue = value.toString();
});
fetchData();
}),*/
