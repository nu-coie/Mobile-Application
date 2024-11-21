import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:profile_app/Edit_Profile.dart';
import 'package:profile_app/welcome_screen.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late User loggedInUser;
  String username = "Loading...";
  String imageUrl = '';
  String job = "Loading...";
  String followers = "1M";
  String phoneNumber = "No Phone";
  String? emailAddress = "No Email";
  String address = "No Address";

  bool isDarkMode = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  void initState()
  {
    super.initState();
    initializeUser();
  }

  Future<void> initializeUser() async
  {
    try
    {
      final currentuse = _auth.currentUser;
      if( currentuse !=null)
      {
        loggedInUser = currentuse;
        loggedInUser.email;
      }
      await  Future.wait([
        getUserInfo(),
        getImageUrl()
      ]);
    }
    catch (e)
    {
      print(e);
    }
  }

  Future<void> getUserInfo() async {
    try {
      final userInfo = await _firestore.collection('ProfileInfo').doc(loggedInUser.uid).get();

      if (userInfo.exists)
      {
        print(loggedInUser.email);
        setState(() {
          username = userInfo.data()?['UserName'] ?? 'No Name';
          job = userInfo.data()?['job'] ?? 'No Job';
          emailAddress = loggedInUser.email;
          phoneNumber = userInfo.data()?['PhoneNumber'] ?? 'No Phone Number';
        });
      } else {
        print('User document not found');
      }
    } catch (e) {
      print('Error fetching user info: $e');
    }
  }


  Future<void> getImageUrl() async {
    try {
      Reference ref = _storage.ref().child('profile_images/${loggedInUser.uid}.jpg');
      String downloadURL = await ref.getDownloadURL();

      setState(()
      {
        imageUrl = downloadURL;
      });
    } catch (e) {
      print('Error fetching profile image from Firebase Storage: $e');
    }
  }


  @override
  Widget build(BuildContext context) {

    final backgroundGradient = isDarkMode ? [Colors.black, Colors.black]:[Colors.purple.shade200, Colors.blue.shade400];

    final textColor = isDarkMode ? Colors.white : Colors.black;
    final subtitleColor = isDarkMode ? Colors.white60 : Colors.black54;
    final cardColor = isDarkMode ? Colors.grey[800] : Colors.white;


    return Scaffold (
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.logout,
            color: textColor,
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut(); // Sign out from Firebase
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()), // Navigate to login
            );
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: textColor),
        ),
        centerTitle: true,
        actions: [
          // Dark Mode Toggle Button
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: textColor,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
          // Edit Profile Button
          IconButton(
            icon: Icon(Icons.edit, color: textColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 80,
                backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : const AssetImage('images/logo.png') as ImageProvider,
              ),
              const SizedBox(height: 20),
              // Name and Job Title
              Text(
                username,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                "$followers  Followers",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: subtitleColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                job,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: subtitleColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              buildContactCard('Phone Number', phoneNumber, cardColor ?? Colors.grey, textColor),
              const SizedBox(height: 10),
              buildContactCard('Email Address', emailAddress ?? 'No Email', cardColor ?? Colors.grey, textColor),
              const SizedBox(height: 10),
              buildContactCard('Address', address, cardColor ?? Colors.grey, textColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactCard(String label, String value, Color cardColor, Color textColor) {
    return Card(
      elevation: 3,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: textColor.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

