import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(

        body: ListView(

          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(backgroundImage: AssetImage('images/Dash.png'),radius: 20,),
                  ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),) ),
                      child: Row(children: [
                        Text("Add new Plan  ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                        Icon(Icons.add)

                      ],))
                ],),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Always be\nin touch",style: TextStyle(fontSize: 70,fontWeight: FontWeight.w600),),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [ Icon(Icons.account_circle_outlined),
                            Text("AT&T",style: TextStyle(fontWeight: FontWeight.w800),),

                          ],),
                          Text("Maxico",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2GB/ 60min",style: TextStyle(fontWeight: FontWeight.w800),),
                              Text("Valid For 24 Days",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white),)

                            ],
                          ),
                          Text("\$32,10",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30),)
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blueAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [ Icon(Icons.account_circle_outlined),
                            Text("AT&T",style: TextStyle(fontWeight: FontWeight.w800),),

                          ],),
                          Text("Maxico",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2GB/ 60min",style: TextStyle(fontWeight: FontWeight.w800),),
                              Text("Valid For 24 Days",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white),)

                            ],
                          ),
                          Text("\$32,10",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30),)
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [ Icon(Icons.account_circle_outlined),
                            Text("AT&T",style: TextStyle(fontWeight: FontWeight.w800),),

                          ],),
                          Text("Maxico",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2GB/ 60min",style: TextStyle(fontWeight: FontWeight.w800),),
                              Text("Valid For 24 Days",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white),)

                            ],
                          ),
                          Text("\$32,10",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30),)
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [ Icon(Icons.account_circle_outlined),
                            Text("AT&T",style: TextStyle(fontWeight: FontWeight.w800),),

                          ],),
                          Text("Maxico",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2GB/ 60min",style: TextStyle(fontWeight: FontWeight.w800),),
                              Text("Valid For 24 Days",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white),)

                            ],
                          ),
                          Text("\$32,10",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30),)
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),




          ],)
    ),
  ));
}
