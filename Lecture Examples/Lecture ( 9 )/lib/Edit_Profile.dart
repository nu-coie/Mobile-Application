import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'profile_page.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  late User loggedInUser;
  String? uidT ;
  String? phoneNumber;
  String? userName;
  String? job;
  String? imageUrl;
  File? selectedImage;
  bool isLoading = true;

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;


  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try
    {
      final user = _auth.currentUser;
      if (user != null)
      {
        loggedInUser = user;
        uidT = loggedInUser.uid;
        await fetchUserProfile();
      }
    }
    catch (e)
    {
      print('Error getting current user: $e');
    }
  }

  Future<void> fetchUserProfile() async
  {
    try {
      final userDoc = await _firestore.collection('ProfileInfo').doc(loggedInUser.uid).get();
      if (userDoc.exists)
      {
        setState(()
        {
          userName = userDoc.data()?['UserName'];
          phoneNumber = userDoc.data()?['PhoneNumber'];
          job = userDoc.data()?['job'];
          imageUrl = userDoc.data()?['ProfileImageURL'];

           _nameController.text = userName ?? '';
          _phoneController.text = phoneNumber ?? '';
          _jobController.text = job ?? '';
        });
      }
    }
    catch (e)
    {
      print('Error fetching user profile: $e');
    }
    finally
    {
      setState(()
      {
        isLoading = false;
      });
    }
  }

  Future<void> selectProfileImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
        });
      }
    } catch (e)
    {
      print('Error selecting profile image: $e');
    }
  }

  Future<void> updateProfile() async
  {
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty || _jobController.text.isEmpty)
    {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields.')),);
      return;
    }
    setState(() { isLoading = true; });
    try {
      String downloadURL = imageUrl ?? '';
      if (selectedImage != null)
      {
        Reference storageReference = _storage.ref().child('profile_images/${loggedInUser.uid}.jpg');
        await storageReference.putFile(selectedImage!);
        downloadURL = await storageReference.getDownloadURL();
      }

         await _firestore.collection('ProfileInfo').doc(uidT).set({
        'userid': uidT,
        'UserName': _nameController.text,
        'job': _jobController.text,
        'PhoneNumber': _phoneController.text,
        'ProfileImageURL': downloadURL,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully!')),);

      // Navigate to profile page after update
      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()),);
    } catch (e) {
      print('Error updating profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error updating profile. Please try again.')),
      );
    }
    finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () async {
                await selectProfileImage();
              },
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.blue,
                backgroundImage: selectedImage != null
                    ? FileImage(selectedImage!)
                    : (imageUrl != null
                    ? NetworkImage(imageUrl!)
                    : null),
                child: selectedImage == null && imageUrl == null
                    ? Icon(Icons.camera_alt,
                    color: Colors.white, size: 50.0)
                    : null,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your Full Name',
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'Enter your Phone Number',
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _jobController,
              decoration: InputDecoration(
                hintText: 'Enter your Job Title',
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius:
                  BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed: updateProfile, // Trigger profile update
                child: Text(
                  'Update Profile',
                  style: TextStyle(color: Colors.white),
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
