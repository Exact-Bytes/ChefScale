import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/camera_page.dart';
import 'package:myapp/profile_page.dart';

class MeasurementPage extends StatelessWidget {
  final String measurementResult;

  const MeasurementPage({Key? key, required this.measurementResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Measurements", style: GoogleFonts.afacad()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              measurementResult.isNotEmpty ? measurementResult : "No measurements available.",
              style: GoogleFonts.afacad(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: const Color(0xFFD4BEE4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navIcon(Icons.home, context, page: const HomePage()),
          _navIcon(Icons.restaurant_menu, context),
          _navIcon(Icons.camera_alt, context, page: const CameraPage()),
          _navIcon(Icons.favorite, context),
          _navIcon(Icons.person, context, page: const ProfilePage()),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, BuildContext context, {Widget? page}) {
    return IconButton(
      icon: Icon(icon, color: Colors.black),
      onPressed: () {
        if (page != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }
}