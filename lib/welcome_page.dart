import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B1E54), // Dark Purple Background
      body: Center( 
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome Text
            Text(
              "Welcome to\nChef Scale",
              textAlign: TextAlign.center,
              style: GoogleFonts.afacad(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            // Placeholder for Logo
            const Icon(Icons.search, size: 120, color: Color(0xFFD4BEE4)),

            const SizedBox(height: 40),

            // Create Account Button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_account');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4BEE4), // Light Purple
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Create account",
                  style: GoogleFonts.afacad(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Sign In Button - Navigates to HomePage
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin'); // Navigate to Sign In Page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black Background
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color(0xFFD4BEE4),
                    ),
                  ),
                ),
                child: Text(
                  "Sign in",
                  style: GoogleFonts.afacad(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
