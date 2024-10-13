import 'package:flutter/material.dart';

//Color(0xffdbf4d3)
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.settings,
                        size: 25,
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.add_alert_sharp,
                              size: 25,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 20,
                            right: 45,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              child: Text(
                                "8",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
                Text(
                  "Friedrich Beren",
                  style: TextStyle(
                      fontFamily: 'PlayWrite',
                      fontWeight: FontWeight.w900,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "@friedrich_beren",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "28K",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "13",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Text(
                            "Avg. posts",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "734K",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(
                            "Likes",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "983K",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Text(
                            "Views",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Text(
                      "Updates",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    child: Text(
                      "Collections",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    child: Text(
                      "About",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Color(0xffdbf4d3),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Added new Post to",style: TextStyle(color: Colors.grey),),
                              subtitle: Text("Technology, Data Visualization"),
                              trailing: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
Padding(padding: EdgeInsets.only(top: 23),
child:
Text("15m ago"),
),
                                  SizedBox(width: 15,),
                                  CircleAvatar(radius: 15,backgroundColor: Colors.white,child: Icon(Icons.image_aspect_ratio,size: 12,),)
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 16,left: 16,bottom: 16),
                            child: Row(

                              children: [

                                ClipRRect(
                                  child: Image.asset('images/cpu.jpg',
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),

                                Expanded(child: Card(color: Colors.white,
                                  child: Padding(padding: EdgeInsets.all(10),
                                    child: Text("Video Recommendations at Joyn:\nTwo Tower or Not to Tower, That Was Never..."),
                                  ),),)
                              ],
                            ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
