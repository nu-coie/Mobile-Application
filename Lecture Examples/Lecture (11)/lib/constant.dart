
import 'package:flutter/material.dart';
final TextEditingController nameController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController priceController = TextEditingController();
final TextEditingController imageUrlController = TextEditingController();
final TextEditingController weightController = TextEditingController();

const kWelcome=TextStyle(
  color: Colors.black,
  fontSize: 30.0,
  fontFamily: 'Agne',
);
const kPetName = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
const kDistance = TextStyle(fontSize: 16, color: Colors.grey);
const kPrice = TextStyle(fontSize: 24,color: Colors.blue,fontWeight: FontWeight.bold,);
const ksee =TextStyle(
  fontSize: 16,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
);
const kBox = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ),
);
final kSearch = InputDecoration(
hintText: "Search here...",
prefixIcon: Icon(Icons.search, color: Color(0xff9188e3)),
filled: true,
fillColor: Colors.white,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(12),
borderSide: BorderSide.none,
),
);
const khomee = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
final  kDonate =  ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
const kCate = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20);
const kExpl = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w600,
    fontSize: 16);
const kho =  TextStyle(
  color: Colors.grey,
  fontSize: 14,
);
final TextEditingController _searchController = TextEditingController();
const khello = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
    fontSize: 18);

const kname = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 20);

final kStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  shadows: [
    Shadow(
      color: Colors.black.withOpacity(0.5),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
  ],
);
const kJobStyle =TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: Colors.white60,
);
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);