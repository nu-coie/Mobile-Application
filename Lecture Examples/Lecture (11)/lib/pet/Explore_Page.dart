import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Animal_Details_Page.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Pets",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff9188e3),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchAllAnimals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("No animals found."),
            );
          }

          final animals = snapshot.data!;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            padding: const EdgeInsets.all(16.0),
            itemCount: animals.length,
            itemBuilder: (context, index) {
              final animal = animals[index];
              return _buildAnimalCard(animal, context);
            },
          );
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchAllAnimals() async {
    final categories = ["Dog", "Cat", "Bird", "Fish"];
    List<Map<String, dynamic>> allAnimals = [];

    for (String category in categories) {
      final snapshot = await FirebaseFirestore.instance
          .collection('animals')
          .doc(category)
          .collection('animals')
          .get();

       for (var doc in snapshot.docs) {
        allAnimals.add({
          ...doc.data(),
          'category': category,
        });
      }
    }

    return allAnimals;
  }

  Widget _buildAnimalCard(Map<String, dynamic> animal, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimalDetailsPage(animalData: animal),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Animal Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                animal['imageUrl'] ?? '',
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Animal Name
                  Text(
                    animal['name'] ?? 'Unknown',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Animal Category
                  Text(
                    animal['category'],
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 4),
                  // Price
                  Text(
                    "\$${animal['price'] ?? 'N/A'}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
