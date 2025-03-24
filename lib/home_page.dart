import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B1E54), // Dark Purple Background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Chef Scale",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // **Header Image with Tagline**
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/header.png",
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Text(
                      "Precision meets Perfection",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // **Get Started Section**
              Text(
                "Get Started!",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),

              // **Feature Buttons**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFeatureButton(Icons.camera_alt, "Snap a photo"),
                  _buildFeatureButton(Icons.upload, "Upload Ingredients"),
                  _buildFeatureButton(Icons.bookmark, "Saved Items"),
                  _buildFeatureButton(Icons.settings, "Settings"),
                ],
              ),

              const SizedBox(height: 30),

              // **How It Works Section**
              Text(
                "How It Works?",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 15),

              // **Swipeable Steps**
              SizedBox(
                height: 220, // Adjust height for mobile view
                child: PageView.builder(
                  itemCount: _howItWorksSteps.length,
                  scrollDirection: Axis.horizontal,
                  controller: PageController(
                    viewportFraction: 0.85,
                  ), // Viewport for partial next card
                  onPageChanged: (index) {},
                  itemBuilder: (context, index) {
                    final step =
                        _howItWorksSteps[index %
                            _howItWorksSteps.length]; // Looping
                    return _buildHowItWorksCard(
                      step['image']!,
                      step['title']!,
                      step['description']!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // **Bottom Navigation Bar**
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFD4BEE4),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
          else {
            // Handle other tab presses if needed.
          }
        },
      ),
    );
  }

  // **Feature Buttons**
  Widget _buildFeatureButton(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFFD4BEE4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }

  // **How It Works Cards**
  Widget _buildHowItWorksCard(String imagePath, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 280, // Mobile-friendly width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// **How It Works Steps (Loopable)**
final List<Map<String, String>> _howItWorksSteps = [
  {
    "image": "assets/side1.png",
    "title": "Snap a Photo",
    "description": "Capture ingredients with one click.",
  },
  {
    "image": "assets/side2.png",
    "title": "Upload Ingredients",
    "description": "Manually add ingredients for accuracy.",
  },
  {
    "image": "assets/side3.png",
    "title": "Get Measurements",
    "description": "Receive precise measurements instantly.",
  },
  {
    "image": "assets/side4.png",
    "title": "Recipe Suggestions",
    "description": "Get smart recipe suggestions based on your ingredients.",
  },
  {
    "image": "assets/side5.png",
    "title": "Save & Favorite",
    "description": "Save your favorite ingredients & recipes.",
  },
];
