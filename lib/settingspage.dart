import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/camera_page.dart';
import 'package:myapp/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3D1C55), // Dark Purple Background
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1C55),
        elevation: 0,
        title: Text("Settings", style: GoogleFonts.afacad(color: Colors.white)),
        centerTitle: true,
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
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://via.placeholder.com/150",
              ), // Replace with actual profile image
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Username",
                hintStyle: GoogleFonts.afacad(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF9B79B9), // Light Purple Container
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                children: [
                  _buildSettingOption("About"),
                  _buildSettingOption("Health"),
                  _buildSettingOption("Notification"),
                  _buildSettingOption("Language"),
                  _buildSettingOption("Privacy"),
                  _buildSettingOption("Log out", showDivider: false),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3D1C55),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Inventory",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Scan"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chat"),
        ],onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CameraPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildSettingOption(String title, {bool showDivider = true}) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: GoogleFonts.afacad(color: Colors.black)),
          trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
          onTap: () {},
        ),
        if (showDivider) Divider(color: Colors.black, thickness: 1),
      ],
    );
  }
}
