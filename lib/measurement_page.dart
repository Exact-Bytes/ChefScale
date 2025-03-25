import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/camera_page.dart';
import 'package:myapp/profile_page.dart';

class MeasurementPage extends StatelessWidget {
  const MeasurementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B1E54), // Dark purple background
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B1E54),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image Container
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/flour.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Measure Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Measure', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
            // Measurement Details Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Flour: Wheat',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Amount: 250 grams',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const Spacer(),
            // Bottom Navigation Bar
            const BottomNavBar(),
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