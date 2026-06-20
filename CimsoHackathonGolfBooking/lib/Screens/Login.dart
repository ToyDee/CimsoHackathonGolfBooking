// screens/login.dart

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cimsohackathongolfbooking/widgets/Custom_navbar.dart';
import 'package:cimsohackathongolfbooking/Models/User_data.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomNavbar(scaffoldKey: _scaffoldKey),
      drawer: CustomNavbar.buildDrawer(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Image.asset(
                'assets/images/9.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width > 600
                    ? 350
                    : MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD7C48A), width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFFD7C48A),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          UserData.login(
                            _emailController.text,
                            '',
                          );
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD7C48A),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/forgotpassword');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFFD7C48A),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: const Text(
                          'Register Here',
                          style: TextStyle(
                            color: Color(0xFFD7C48A),
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}