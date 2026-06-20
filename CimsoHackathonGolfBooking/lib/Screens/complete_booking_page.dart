import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../widgets/custom_navbar.dart'; // Use CustomNavbar
import '../widgets/Footer.dart'; // Use Footer
import 'booking_complete_page.dart';

class CompleteBookingPage extends StatelessWidget {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final int playerCount;

  const CompleteBookingPage({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.playerCount,
  });

  String formatDate(DateTime date) {
    return DateFormat('EEEE\nd MMMM yyyy').format(date);
  }

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('h:mm a').format(dt);
  }

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
              'assets/images/course_banner.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 220,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Complete your booking",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFFFD700),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  infoRow(Icons.calendar_today, formatDate(selectedDate)),
                  const SizedBox(height: 10),
                  infoRow(Icons.access_time,
                      "${formatTime(selectedTime)}\n$playerCount Player${playerCount > 1 ? 's' : ''} (18 holes or Twilight)"),
                  const SizedBox(height: 10),
                  priceRow("Total Price in Thai Baht", "฿ ${4100 * playerCount}.00"),
                  const SizedBox(height: 20),
                  promoCodeField(),
                  const SizedBox(height: 30),
                  const Text(
                    "Rate includes / Notes",
                    style: TextStyle(
                      color: Color(0xFFF6E5A3),
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "-18 Holes.\n"
                        "-Optional golf cart per player can be booked at check-in, with a THB 500 cart fee due.\n"
                        "-Can call caddie for each player at check-in with a THB 400 fee per player\n"
                        "-Please adhere to safety guidelines",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Personal Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF6E5A3),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 10),
                  nameFields(),
                  const SizedBox(height: 10),
                  whiteTextField("Email"),
                  const SizedBox(height: 10),
                  phoneField(),
                  const SizedBox(height: 30),
                  const Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF6E5A3),
                    ),
                  ),
                  const SizedBox(height: 10),
                  paymentIcons(),
                  const SizedBox(height: 10),
                  whiteTextField("Card Number"),
                  const SizedBox(height: 10),
                  expiryFields(),
                  const SizedBox(height: 30),
                  const Text(
                    "Reservation",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF6E5A3),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 10),
                  /// Center all Reservation Text
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          "No booking fees! Your booking will be guaranteed at Pioneer Golf Club.\n"
                              "We use safety measures for your personal information.\n"
                              "You agree with our Pioneer Golf Club’s Terms & Conditions to complete the booking.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFFF6E5A3)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingCompletePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF6E5A3),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Book now for ฿ ${4100 * playerCount}.00',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "You will receive an instant confirmation to your email",
                      style: TextStyle(
                        color: Color(0xFFF6E5A3),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            const Footer(), // Use Footer
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget priceRow(String label, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFF6E5A3))),
        Text(price, style: const TextStyle(color: Color(0xFFF6E5A3), fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget promoCodeField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "promo code",
        prefixIcon: const Icon(Icons.local_offer),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget nameFields() {
    return Row(
      children: [
        Expanded(child: whiteTextField("First name")),
        const SizedBox(width: 10),
        Expanded(child: whiteTextField("Last name")),
      ],
    );
  }

  Widget phoneField() {
    return Row(
      children: [
        CountryCodePicker(
          onChanged: print,
          initialSelection: 'TH',
          favorite: const ['+66', 'TH'],
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
        ),
        const SizedBox(width: 10),
        Expanded(child: whiteTextField("Telephone Number")),
      ],
    );
  }

  Widget whiteTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget paymentIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/visa.png', height: 22),
        Image.asset('assets/images/mastercard.png', height: 22),
        Image.asset('assets/images/jcb.png', height: 22),
        Image.asset('assets/images/bank_transfer.png', height: 22),
      ],
    );
  }

  Widget expiryFields() {
    return Row(
      children: [
        Expanded(child: whiteTextField("Month")),
        const SizedBox(width: 10),
        Expanded(child: whiteTextField("Year")),
        const SizedBox(width: 10),
        Expanded(child: whiteTextField("CVC")),
      ],
    );
  }
}