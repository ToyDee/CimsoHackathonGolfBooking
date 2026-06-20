// screens/6510046_course_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // For map functionality
import 'package:latlong2/latlong.dart'; // For latitude and longitude calculations
import '../widgets/custom_navbar.dart'; // Use CustomNavbar
import '../widgets/Footer.dart'; // Use Footer

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

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
            Image.asset('assets/images/course_banner.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  const Text(
                    "THE COURSE",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFFFFD700),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Located in Pathum Thani, Pioneer Ridge Golf Course offers a unique golfing experience with beautiful scenery and a challenging layout. Our course is perfect for golfers of all levels, featuring signature holes and scenic views. Whether you're here for a relaxing round or a competitive game, you’ll find everything you need for a memorable day on the course.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  _buildCenterText("Signature Hole", "18th, 124 yards Par-3 with Ocean views to Love Island and Zeus Mountain."),
                  _buildCenterText("Total distance", "7,361 yards, par 72"),
                  _buildCenterText("Average Green Speeds", "10.2 - 10.5"),
                  _buildCenterText(
                    "Grass Type",
                    "Tees: Paspalum\nFairways: Zoysia\nGreens: Tiff Eagle",
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "GOLF COURSE",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFFFD700),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildHoleCard(
                    imagePath: 'assets/images/hole_1.png',
                    holeTitle: 'HOLE 1',
                    description:
                    'Welcome to Hole 1, the perfect start to your round. This par-4 hole offers a generous fairway, but with strategically placed bunkers and a water hazard, precision off the tee is key. Prepare for a memorable opening challenge as you set the tone for the rest of your game.',
                  ),
                  _buildHoleCard(
                    imagePath: 'assets/images/hole_2.png',
                    holeTitle: 'HOLE 2',
                    description:
                    'Moving on to Hole 2, a par-3 that will test your accuracy. With a challenging green surrounded by sand traps, a well-placed iron shot is essential to avoid the hazards and set yourself up for a solid par.',
                  ),
                  _buildHoleCard(
                    imagePath: 'assets/images/hole_3.png',
                    holeTitle: 'HOLE 3',
                    description:
                    'Hole 3 is a long par-5 that demands both power and precision. The fairway is wide, but a tricky dogleg and strategically placed bunkers near the green will require careful shot placement to reach the green in regulation.',
                  ),
                  _buildHoleCard(
                    imagePath: 'assets/images/hole_4.png',
                    holeTitle: 'HOLE 4',
                    description:
                    'On Hole 4, a par-4, you’ll need a precise tee shot to navigate the narrow fairway, which is bordered by trees and bunkers. The approach to the green is uphill, making club selection important as you aim for a well-protected green.',
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/bookteetime');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6E5A3),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      "Book now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 250,
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(13.9891, 100.6181),
                        zoom: 13.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(13.9891, 100.6181),
                              width: 40,
                              height: 40,
                              builder: (context) => const Icon(Icons.location_on, color: Colors.red, size: 40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Footer(), // Use Footer
          ],
        ),
      ),
    );
  }

  Widget _buildCenterText(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF6E5A3),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
            softWrap: true, // Allow text to wrap
            overflow: TextOverflow.ellipsis, // Handle overflow gracefully
            maxLines: 3, // Limit lines to prevent overflow
          ),
        ],
      ),
    );
  }

  Widget _buildHoleCard({
    required String imagePath,
    required String holeTitle,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A221D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                child: Image.asset(imagePath, height: 180, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      holeTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFFF6E5A3),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: const TextStyle(color: Colors.white),
                      softWrap: true, // Allow text to wrap
                      overflow: TextOverflow.ellipsis, // Handle overflow gracefully
                      maxLines: 4, // Limit lines to prevent overflow
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "HOLE STATS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFFF6E5A3),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text("Par 4", style: TextStyle(color: Colors.white)),
                    const Text("Stroke Index - Men's: 8 / Ladies: 7", style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Make stats horizontally scrollable
                      child: Row(
                        children: const [
                          _ColorStatBox(color: Colors.red, label: '327 yards'),
                          SizedBox(width: 8),
                          _ColorStatBox(color: Colors.blue, label: '402 yards'),
                          SizedBox(width: 8),
                          _ColorStatBox(color: Colors.white, label: '377 yards'),
                          SizedBox(width: 8),
                          _ColorStatBox(color: Colors.yellow, label: '423 yards'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ColorStatBox extends StatelessWidget {
  final Color color;
  final String label;

  const _ColorStatBox({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}