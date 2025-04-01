import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedRecipesPage extends StatelessWidget {
  const SavedRecipesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3D1C55), // Dark purple background
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1C55),
        elevation: 0,
        title: Text("Saved", style: GoogleFonts.afacad(color: Colors.white)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Saved", style: GoogleFonts.afacad(fontSize: 18, color: Colors.white)),
            SizedBox(height: 15),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFFE5D4ED), // Light purple
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 40, color: Colors.black),
                  SizedBox(height: 5),
                  Text("Favorite Recipes",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.afacad(fontSize: 14, color: Colors.black)),
                ],
              ),
            ),
           ],
        ),
      ),
    );
  }
}
