import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart'; // Use CustomNavbar

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF1E1B18),
      appBar: CustomNavbar(scaffoldKey: _scaffoldKey), // Use CustomNavbar
      drawer: CustomNavbar.buildDrawer(context), // Use CustomNavbar's drawer
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/golf_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay
          Container(color: Colors.black.withOpacity(0.4)),

          // Main content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Container(
                    width: 600,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Please enter your email address. We will send you an OTP to create\na new password via email.',
                          style: TextStyle(
                            color: Color(0xFFF5DEB3),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),

                        // Email Input
                        TextField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined, color: Colors.black),
                            hintText: 'example@gmail.com',
                            hintStyle: const TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Reset Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/otp');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Reset password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF5DEB3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}