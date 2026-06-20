// screens/mainpage.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cimsohackathongolfbooking/widgets/Custom_navbar.dart';
import 'package:cimsohackathongolfbooking/widgets/Footer.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _autoSlideTimer;

  final List<String> _images = [
    'assets/images/2.png',
    'assets/images/3.jpg',
    'assets/images/4.webp',
  ];

  final List<Map<String, dynamic>> _features = [
    {
      'image': 'assets/images/5.jpg',
      'title': 'Championship Courses',
      'description': 'Master our 18-hole championship courses designed by golf legends',
    },
    {
      'image': 'assets/images/6.jpg',
      'title': 'Book Now',
      'description': 'Secure your tee time online for exclusive access',
    },
    {
      'image': 'assets/images/7.png',
      'title': 'Golf Club',
      'description': 'Premium equipment from trusted brands',
    },
  ];

  final List<Map<String, dynamic>> _reviews = [
    {
      'text': '"This has to be one of the most beautiful courses we have had the pleasure '
          'of playing on in Thailand! The view is stunning, the club house is immaculate '
          'and the caddies are up there with the best!"',
      'author': 'Doug Sanders',
      'rating': 5,
    },
    {
      'text': '"This is indeed a five-star course that is very well maintained and challenging '
          'even from the white tees. The caddies were very impressive and could adapt to '
          'the golfers very well."',
      'author': 'Ong Meng Hua',
      'rating': 5,
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoSlideTimer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_pageController.hasClients) {
        final nextPage = (_currentIndex + 1) % _images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _resetAutoScroll() {
    _autoSlideTimer?.cancel();
    _startAutoScroll();
  }

  void _manualNavigate(bool isNext) {
    _resetAutoScroll();
    final newIndex = isNext
        ? (_currentIndex + 1) % _images.length
        : (_currentIndex - 1) < 0
        ? _images.length - 1
        : _currentIndex - 1;
    _pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildFeatureBox(Map<String, dynamic> feature, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 600
          ? MediaQuery.of(context).size.width * 0.28
          : MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFD7C48A).withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              feature['image'],
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  feature['title'],
                  style: const TextStyle(
                    color: Color(0xFFD7C48A),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  feature['description'],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewBox(Map<String, dynamic> review, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 800
          ? MediaQuery.of(context).size.width * 0.45
          : MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFCDADAD).withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFCDADAD).withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: -10,
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            review['text'],
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFD7C48A),
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            review['author'],
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFD7C48A),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              review['rating'],
                  (index) => const Icon(
                Icons.star,
                color: Color(0xFFD7C48A),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: CustomNavbar(scaffoldKey: _scaffoldKey),
      drawer: CustomNavbar.buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Slider
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => _manualNavigate(false),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: () => _manualNavigate(true),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _images.asMap().entries.map((entry) {
                        int index = entry.key;
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Welcome Text Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFCDADAD).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFCDADAD).withOpacity(0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      spreadRadius: -10,
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Greetings\n',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFD7C48A),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFD7C48A),
                          decorationThickness: 1.5,
                        ),
                      ),
                      TextSpan(
                        text:
                        'Elegantly ranked among the Top 10 Golf Courses in Asia, Pioneer Golf Club offers '
                            'an exclusive, world-class golfing experience. Immerse yourself in breathtaking '
                            'landscapes while navigating our meticulously designed championship courses. With '
                            'unparalleled service and state-of-the-art facilities, every moment here exudes luxury. '
                            'Indulge in the epitome of golfing excellence.\n'
                            '\"Book your tee time today and elevate your game at Pioneer Golf Club.\"',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFD7C48A),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Features Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    'Our Premium Facilities',
                    style: TextStyle(
                      fontSize: 22,
                      color: const Color(0xFFD7C48A),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xFFD7C48A),
                      decorationThickness: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _features
                              .map((feature) =>
                              _buildFeatureBox(feature, context))
                              .toList(),
                        );
                      } else {
                        return Column(
                          children: _features
                              .map((feature) =>
                              _buildFeatureBox(feature, context))
                              .toList(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Reviews Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    'Player Reviews',
                    style: TextStyle(
                      fontSize: 24,
                      color: const Color(0xFFD7C48A),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xFFD7C48A),
                      decorationThickness: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _reviews
                              .map((review) =>
                              _buildReviewBox(review, context))
                              .toList(),
                        );
                      } else {
                        return Column(
                          children: _reviews
                              .map((review) =>
                              _buildReviewBox(review, context))
                              .toList(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            Padding(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  const Text(
                    'Visit Us',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFD7C48A),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFD7C48A),
                      decorationThickness: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://maps.app.goo.gl/CKMW7tDXge65kUZh9');
                    },
                    child: Image.asset(
                      'assets/images/8.png',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Footer Section
            const Footer(),
          ],
        ),
      ),
    );
  }
}