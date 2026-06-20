// lib/pages/6510046_booking_complete_page.dart

import 'package:flutter/material.dart';
import '../widgets/Custom_navbar.dart'; // Use CustomNavbar
import '../widgets/Footer.dart'; // Use Footer

class BookingCompletePage extends StatelessWidget {
  const BookingCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF1E1815),
      appBar: CustomNavbar(scaffoldKey: _scaffoldKey), // Use CustomNavbar
      drawer: CustomNavbar.buildDrawer(context), // Use CustomNavbar's drawer
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/booking_complete_banner.png', // Make sure this image exists
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              "Booking Complete",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Thank you for your booking! Your reservation at our golf club has been successfully confirmed. "
                    "We have sent a booking ticket to your email. We look forward to welcoming you on your scheduled date.\n\n"
                    "Please keep your booking details for reference, and don’t hesitate to contact us if you need further assistance.\n\n"
                    "Enjoy your time at our golf club, and we can’t wait to see you soon!",
                style: TextStyle(
                  color: Color(0xFFF5DEB3),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),

            // Buttons Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6E5A3),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // You can implement printing logic later
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Ticket sent to printer!")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6E5A3),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Print Ticket',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),
            const Footer(), // Use Footer
          ],
        ),
      ),
    );
  }
}