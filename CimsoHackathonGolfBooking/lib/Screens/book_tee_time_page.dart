// lib/pages/6510046_book_tee_time_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/Custom_navbar.dart'; // Use CustomNavbar
import '../widgets/Footer.dart'; // Use Footer
import 'complete_booking_page.dart';

class BookTeeTimePage extends StatefulWidget {
  const BookTeeTimePage({super.key});

  @override
  State<BookTeeTimePage> createState() => _BookTeeTimePageState();
}

class _BookTeeTimePageState extends State<BookTeeTimePage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 6, minute: 0);
  int playerCount = 1;
  final int pricePerPlayer = 4100;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

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
    final int totalPrice = pricePerPlayer * playerCount;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF1E1815),
      appBar: CustomNavbar(scaffoldKey: _scaffoldKey), // Use CustomNavbar
      drawer: CustomNavbar.buildDrawer(context), // Use CustomNavbar's drawer
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const Text(
                    "Book Tee Time",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Book Tee Times at Pioneer Golf Club",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF6E5A3),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSelectableCard(
                          title: "Select Date of Play",
                          content: formatDate(selectedDate),
                          onTap: _selectDate,
                        ),
                        _buildSelectableCard(
                          title: "Tee Time & Players",
                          content: "${formatTime(selectedTime)}\n$playerCount Player${playerCount > 1 ? 's' : ''} (18 Holes)",
                          onTap: _selectTime,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Number of Players: ",
                        style: TextStyle(
                          color: Color(0xFFF6E5A3),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      DropdownButton<int>(
                        value: playerCount,
                        dropdownColor: Colors.black,
                        iconEnabledColor: const Color(0xFFF6E5A3),
                        style: const TextStyle(
                            color: Color(0xFFF6E5A3),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        items: List.generate(10, (index) => index + 1)
                            .map((count) => DropdownMenuItem(
                          value: count,
                          child: Text("$count"),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            playerCount = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(height: 10),
                  Text(
                    "Total - ฿ ${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Color(0xFFF6E5A3),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rate includes / Notes",
                          style: TextStyle(
                            color: Color(0xFFF5DEB3),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          "- 18 Holes.\n"
                              "- Optional golf cart per player can be booked\n"
                              "  at check-in, with a THB 500 cart fee due.\n"
                              "- Can call caddie for each player at check-in\n"
                              "  with a THB 400 fee per player\n"
                              "- Please adhere to safety guidelines",
                          style: TextStyle(
                            color: Color(0xFFF5DEB3),
                            fontSize: 16,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cancellation policy  ⓘ",
                          style: TextStyle(
                              color: Color(0xFFF6E5A3),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          "Total - ฿ ${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                              color: Color(0xFFF6E5A3),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteBookingPage(
                            selectedDate: selectedDate,
                            selectedTime: selectedTime,
                            playerCount: playerCount,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6E5A3),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      "Book now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Continue to complete booking and receive confirmation",
                    style: TextStyle(
                        color: Color(0xFFF6E5A3),
                        fontWeight: FontWeight.w600),
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

  Widget _buildSelectableCard({
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFFF6E5A3),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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