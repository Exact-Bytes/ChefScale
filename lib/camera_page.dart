import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/home_page.dart';
import 'package:myapp/profile_page.dart';
import 'dart:convert';
import 'dart:io';
import 'measurement_page.dart'; // Import the MeasurementPage

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String _measurementResult = "";

  // Function to Open Camera
  Future<void> _openCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
        // Call the Google Cloud Vision API
        await _processImage(_image!);
      }
    } catch (e) {
      _showErrorDialog("Camera access denied or unavailable.");
    }
  }

  // Function to Pick Image from Gallery
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
        // Call the Google Cloud Vision API
        await _processImage(_image!);
      }
    } catch (e) {
      _showErrorDialog("Failed to access gallery.");
    }
  }

  // Function to Process Image with Google Cloud Vision API
  Future<void> _processImage(File image) async {
    final String apiKey = "AIzaSyBpQZqMCyCFlF4jGc_haJD_za3fU0USRUg"; // Replace with your API key
    final String apiUrl = "https://vision.googleapis.com/v1/images:annotate?key=$apiKey";

    // Convert image to base64
    final bytes = await image.readAsBytes();
    String base64Image = base64Encode(bytes);

    // Prepare the request body
    final requestBody = jsonEncode({
      "requests": [
        {
          "image": {
            "content": base64Image,
          },
          "features": [
            {
              "type": "LABEL_DETECTION",
              "maxResults": 10,
            },
          ],
        },
      ],
    });

    // Send the request
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // Process the response to extract measurements
        _extractMeasurements(data);
      } else {
        _showErrorDialog("Failed to process image. Error: ${response.body}");
      }
    } catch (e) {
      _showErrorDialog("An error occurred while processing the image.");
    }
  }

  // Function to Extract Measurements from Vision API Response
 void _extractMeasurements(Map<String, dynamic> data) {
  var labels = data['responses'][0]['labelAnnotations'];
  String measurements = "";

  // Define example mappings of detected items to grams
  Map<String, int> itemToGrams = {
    "Flour": 100,       // Example: 100 grams for flour
    "Sugar": 50,       // Example: 50 grams for sugar
    "Rice": 200,       // Example: 200 grams for rice
    // Add more items and their gram values as needed
  };

  for (var label in labels) {
    String description = label['description'];
    if (itemToGrams.containsKey(description)) {
      measurements += "$description detected. Amount: ${itemToGrams[description]} grams.\n";
    } else {
      measurements += "$description detected.\n";
    }
  }

  setState(() {
    _measurementResult = measurements;
  });

  // Navigate to MeasurementPage with the measurement result
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MeasurementPage(measurementResult: _measurementResult),
    ),
  );
}

  // Show Error Dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error", style: GoogleFonts.afacad()),
        content: Text(message, style: GoogleFonts.afacad()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: GoogleFonts.afacad()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B1E54),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: _openCamera,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: _image == null
                    ? Center(
                        child: Text(
                          "Click To Take Photo",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.afacad(color: Colors.black),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(_image!, fit: BoxFit.cover),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Display Measurement Result
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _measurementResult.isNotEmpty ? _measurementResult : "No measurements yet.",
              style: GoogleFonts.afacad(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          // Take a Snap Button
          ElevatedButton(
            onPressed: _openCamera,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4BEE4),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: Text(
                           "Take a Snap",
              style: GoogleFonts.afacad(color: Colors.black, fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          // Upload Photo Option (Gallery)
          ElevatedButton(
            onPressed: _pickImageFromGallery,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4BEE4),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: Text(
              "Upload from Gallery",
              style: GoogleFonts.afacad(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFD4BEE4),
        currentIndex: 2, // Set the current index to the camera page
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Recipes",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Scan"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index == 0) {
            // Navigate to Home Page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 4) {
            // Navigate to Profile Page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
          // Add other navigation cases as needed
        },
      ),
    );
  }
}