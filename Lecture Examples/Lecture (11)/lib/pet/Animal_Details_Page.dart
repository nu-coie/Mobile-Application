import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:profile_app/constant.dart';
class AnimalDetailsPage extends StatefulWidget {

  final Map<String, dynamic> animalData;
  const AnimalDetailsPage({required this.animalData});

  @override
  _AnimalDetailsPageState createState() => _AnimalDetailsPageState();
}

class _AnimalDetailsPageState extends State<AnimalDetailsPage> {
  bool isExpanded = false;
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();

    latitude = 33.2891941;
    longitude = 44.3573716;

    print(latitude);
  }

  @override
  Widget build(BuildContext context) {
    final String fullDescription = widget.animalData['description'] ?? "No description available.";
    final int maxWords = 50;
    final List<String> words = fullDescription.split(' ');
    final String truncatedDescription = words.length > maxWords
        ? words.sublist(0, maxWords).join(' ') + '...'
        : fullDescription;

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black),onPressed: () => Navigator.pop(context),),
        actions: [
          IconButton(icon: Icon(Icons.favorite, color: Colors.red),onPressed: () {},),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Section
          Stack(
            alignment: Alignment.center,

            children: [

              CircleAvatar(radius: 130,backgroundColor: Colors.purple[100],),
              CircleAvatar( radius: 110, backgroundImage: NetworkImage(widget.animalData['imageUrl'] ?? "",),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Information Section
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: kBox,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(widget.animalData['name'] ?? "Unknown",style: kPetName),
                          SizedBox(height: 4),

                          Text("${widget.animalData['distance'] ?? 0} Km Away",style: kDistance,),

                        ],
                      ),
                      Text("\$${widget.animalData['price'] ?? "0"}", style: kPrice ,),
                    ],
                  ),
                  SizedBox(height: 20),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      _infoCard("Age", "${widget.animalData['age'] ?? "N/A"} Years", Colors.orange[100]!),
                      _infoCard("Sex", widget.animalData['sex'] ?? "Unknown", Colors.purple[100]!),
                      _infoCard("Weight", "${widget.animalData['weight'] ?? "N/A"} Kg", Colors.green[100]!),
                    ],
                  ),
                  SizedBox(height: 20),


                  Text("Pet's Location",style: kPrice,),
                  SizedBox(height: 20),


                  Text("About ${widget.animalData['name']}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8),

                  Text(isExpanded ? fullDescription : truncatedDescription,style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                  SizedBox(height: 8),

                  GestureDetector(
                    onTap: () {
                      setState(() { isExpanded = !isExpanded;});},
                      child: Text(isExpanded ? "See Less" : "See More",style: ksee, ),),

              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(latitude, longitude),
                    zoom: 16,
                  )
                  ,
                  markers: {
                    Marker(
                      markerId: MarkerId('petLocation'),
                      position: LatLng(latitude, longitude),
                      infoWindow: InfoWindow(
                        title: widget.animalData['name'] ?? "Pet Location",
                      ),
                    )

                  },
                ),
              ),



                ],
              )

            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String title, String value, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
