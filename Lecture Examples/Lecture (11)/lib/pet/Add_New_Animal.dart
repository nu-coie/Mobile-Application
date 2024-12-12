import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:profile_app/constant.dart';

class AddAnimalPage extends StatefulWidget {
  @override
  _AddAnimalPageState createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends State<AddAnimalPage> {
  String sex = "Male";
  String selectedCategory = "Dog";
  double? latitude;
  double? longitude;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _getUserLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permission Denied");
      } else {
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
          ),
        );
        setState(() {
          longitude = position.longitude;
          latitude = position.latitude;
        });
        print("Longitude: $longitude, Latitude: $latitude");
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage() async {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select an image.")),
      );
      return null;
    }

    try {
      final user = _auth.currentUser;
      final fileName = '${user!.uid}_${DateTime.now().millisecondsSinceEpoch}';
      final ref = FirebaseStorage.instance.ref().child('animal_images/$fileName');
      final uploadTask = ref.putFile(_imageFile!);
      final snapshot = await uploadTask.whenComplete(() => {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<void> _addAnimal() async {
    final user = _auth.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User not logged in.")),
      );
      return;
    }

    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Name is required")),
      );
      return;
    }

    final imageUrl = await _uploadImage();
    if (imageUrl == null) return;

    FirebaseFirestore.instance
        .collection('animals')
        .doc(selectedCategory)
        .collection('animals')
        .add({
      'userId': user.uid,
      'name': nameController.text,
      'distance': 2,
      'age': int.tryParse(ageController.text) ?? 0,
      'price': int.tryParse(priceController.text) ?? 0,
      'imageUrl': imageUrl,
      'weight': int.tryParse(weightController.text) ?? 0,
      'latitude': latitude?.toString() ?? "",
      'longitude': longitude?.toString() ?? "",
      'sex': sex,
      'category': selectedCategory,
      'isAdopted': false,
      'isFavorite': false,
      'description': "No description provided.",
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Animal added successfully!")),);

    }).catchError((error) {
      print("Error adding animal: $error");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add animal.")),
      );});
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Add New Pet")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            DropdownButton<String>(
              value: selectedCategory,
              items: ["Dog", "Cat", "Fish", "Bird"]
                  .map((category) => DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            SizedBox(height: 10),

            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Age (in years)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: "Price (in \$)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: "Weight (in kg)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Text("Sex:"),

            Row(
              children: [
                Radio<String>(
                  value: "Male",
                  groupValue: sex,
                  onChanged: (value) {
                    setState(() {
                      sex = value!;
                    });
                  },
                ), Text("Male"),



                Radio<String>(
                  value: "Female",
                  groupValue: sex,
                  onChanged: (value) {
                    setState(() {
                      sex = value!;
                    });
                  },
                ),Text("Female"),


              ],
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pick Image"),
            ),
            if (_imageFile != null)
              Image.file(
                _imageFile!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: _getUserLocation,
              child: Text("Get Location"),),
            if (latitude != null && longitude != null)
              Text("Lat: ${latitude!.toStringAsFixed(2)}, Lng: ${longitude!.toStringAsFixed(2)}"),

            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _addAnimal,
                child: Text("Add Animal"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
