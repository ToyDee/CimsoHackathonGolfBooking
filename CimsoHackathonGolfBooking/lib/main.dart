// main.dart

import 'package:cimsohackathongolfbooking/Screens/Register.dart';
import 'package:cimsohackathongolfbooking/Screens/change_password_page.dart';
import 'package:cimsohackathongolfbooking/Screens/forgot_password_page.dart';
import 'package:cimsohackathongolfbooking/Screens/course_page.dart';
import 'package:cimsohackathongolfbooking/Screens/otp_verification_page.dart';
import 'package:cimsohackathongolfbooking/Screens/book_tee_time_page.dart';
import 'package:cimsohackathongolfbooking/Screens/check_booking.dart';
import 'package:cimsohackathongolfbooking/Screens/profile_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:cimsohackathongolfbooking/Screens/MainPage.dart'; // Import MainPage
import 'package:cimsohackathongolfbooking/Screens/Login.dart'; // Import LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainPage(title: 'Home Page'),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/courses': (context) => const CoursePage(),
        '/changepassword': (context) => const ChangePasswordPage(),
        '/forgotpassword': (context) => const ForgotPasswordPage(),
        '/otp': (context) => const OTPVerificationPage(),
        '/bookteetime': (context) => const BookTeeTimePage(),
        '/checkbooking': (context) => BookingDetailsPage(),
        '/profile': (context) =>  ProfileEditApp(),
      },
    );
  }
}