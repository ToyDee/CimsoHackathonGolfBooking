import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart'; // Import CustomNavbar
import '../widgets/Footer.dart'; // Import Footer

class BookingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomNavbar(scaffoldKey: _scaffoldKey), // Use CustomNavbar
      drawer: CustomNavbar.buildDrawer(context), // Add drawer functionality
      backgroundColor: Colors.black, // Match the theme
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: List.generate(4, (index) => BookingCard()),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add spacing before the footer
            const Footer(), // Add Footer
          ],
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://storage.googleapis.com/a1aa/image/1C9x2B7aO5rBZ4YlfaRGAPxEH4SS0ULOFPPEk3L4YAw.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booking ID #53984',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Match text color
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Name : Lin Nay Wun    Phone : 0986493727',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Email : linnay.w65@rsu.ac.th',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 4,
              children: [
                BookingDetailItem(title: 'Hole', value: '9 Hole'),
                BookingDetailItem(title: 'Date of Play', value: '11 May 2023'),
                BookingDetailItem(title: 'Tee Time', value: '06 : 00'),
                BookingDetailItem(title: 'Players', value: '7'),
                BookingDetailItem(title: 'Amount', value: '4,100 THB'),
                BookingDetailItem(title: 'Booking Status', value: 'Booked'),
              ],
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {},
                child: const Text('Cancel Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingDetailItem extends StatelessWidget {
  final String title;
  final String value;

  BookingDetailItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}