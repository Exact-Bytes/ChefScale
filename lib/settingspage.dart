import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? selectedOption;

  void _showContent(String title, String content) {
    setState(() {
      selectedOption = title;
    });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: GoogleFonts.afacad(fontWeight: FontWeight.bold)),
          content: Text(content, style: GoogleFonts.afacad()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D1C55),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D1C55),
        elevation: 0,
        title: Text("Settings", style: GoogleFonts.afacad(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://via.placeholder.com/150"),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF9B79B9),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                children: [
                  _buildSettingOption("About", "Chef Scale is an AI-powered baking assistant that helps users accurately measure ingredients using image recognition technology."),
                  _buildSettingOption("Health", "Maintain a healthy lifestyle by ensuring accurate ingredient measurements and portion control while baking."),
                  _buildSettingOption("Notification", "Get real-time stock alerts, reminders for recipe steps, and updates about ingredient availability."),
                  _buildSettingOption("Language", "Select your preferred language for using the Chef Scale app. We support multiple languages to enhance user experience."),
                  _buildSettingOption("Privacy", "Your data privacy is our priority. We ensure secure handling of your images and personal information in compliance with regulations."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingOption(String title, String content) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: GoogleFonts.afacad(color: Colors.black)),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () => _showContent(title, content),
        ),
        const Divider(color: Colors.black, thickness: 1),
      ],
    );
  }
}

