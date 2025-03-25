import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFF3B1E54), // Background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 100),
            const Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            const SignInForm(),
            const SizedBox(height: 20),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Divider(color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Divider(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 55, // Same height as username/password fields
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, color: Colors.black, size: 35),
                label: Text(
                  'Continue with Google',
                  style: GoogleFonts.afacad(color: Colors.black, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4BEE4), // Updated color
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 55, // Same height as username/password fields
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone, color: Colors.black, size: 35),
                label: Text(
                  'Continue with Number',
                  style: GoogleFonts.afacad(color: Colors.black, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4BEE4), // Updated color
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 55, // Consistent height
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black, // Black background
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white), // White border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 55, // Consistent height
            child: TextField(
              obscureText: true, // Hide password
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 45, // Smaller height for compact look
            width: 100, // Smaller width
            child: ElevatedButton(
              onPressed: () {
                // Handle sign in
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Black button
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
