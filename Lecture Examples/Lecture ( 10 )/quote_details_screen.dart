import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

class QuoteDetailsScreen extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final String? author;

  QuoteDetailsScreen({
    required this.text,
    this.imageUrl,
    this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$author, Said"),
        backgroundColor: Colors.teal[50],
      ),
      body: Stack(
        children: [
          // Background Image
          if (imageUrl != null)
            Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),


          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.2),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Icon(
                  Icons.format_quote,
                  color: Colors.white70,
                  size: 50,
                ),
                SizedBox(height: 20),

                // Quote Text
                Text(
                  "\"$text\"",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.8),
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),

                // Author Name
                if (author != null)
                  Text(
                    "- $author",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                Spacer(),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Share Button
                    IconButton(
                      icon: Icon(Icons.share),
                      color: Colors.white,
                      iconSize: 28,
                      onPressed: () {
                        Share.share("\"$text\" - ${author ?? "Unknown"}");
                      },
                    ),

                    SizedBox(width: 20),

                    // Copy Button
                    IconButton(
                      icon: Icon(Icons.copy),
                      color: Colors.white,
                      iconSize: 28,
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Quote copied to clipboard!")),
                        );
                      },
                    ),

                    SizedBox(width: 20),

                     IconButton(
                      icon: Icon(Icons.bookmark_outline),
                      color: Colors.white,
                      iconSize: 28,
                      onPressed: () {
                        // Add bookmark functionality
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
