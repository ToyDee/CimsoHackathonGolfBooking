// widgets/custom_navbar.dart

import 'package:flutter/material.dart';
import '../Models/User_data.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomNavbar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF221D1D),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFFD7C48A)),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.5),
            child: Container(
              height: preferredSize.height,
              width: 100,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/Images/1.webp',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF221D1D),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFD7C48A)),
            child: Text(
              UserData.isLoggedIn
                  ? 'Welcome, ${UserData.firstName} ${UserData.lastName}'
                  : 'Menu',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color(0xFFD7C48A)),
            title: const Text('Home', style: TextStyle(color: Color(0xFFD7C48A))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.golf_course, color: Color(0xFFD7C48A)),
            title: const Text('Courses', style: TextStyle(color: Color(0xFFD7C48A))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/courses');
            },
          ),
          // Book Button
          ListTile(
            leading: const Icon(Icons.event_seat, color: Color(0xFFD7C48A)),
            title: const Text('Book', style: TextStyle(color: Color(0xFFD7C48A))),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/bookteetime');
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Color(0xFFD7C48A)),
            title: const Text('EN/TH', style: TextStyle(color: Color(0xFFD7C48A))),
            onTap: () {
              Navigator.pop(context);

            },
          ),
          if (UserData.isLoggedIn)
            ListTile(
              leading: const Icon(Icons.edit, color: Color(0xFFD7C48A)),
              title: const Text('Edit Profile', style: TextStyle(color: Color(0xFFD7C48A))),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/profile');
              },
            ),

          if (UserData.isLoggedIn)
            ListTile(
              leading: const Icon(Icons.calendar_month, color: Color(0xFFD7C48A)),
              title: const Text('Check Reservations', style: TextStyle(color: Color(0xFFD7C48A))),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/checkbooking');
              },
            ),

          if (UserData.isLoggedIn)
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFD7C48A)),
              title: const Text('Logout', style: TextStyle(color: Color(0xFFD7C48A))),
              onTap: () {

                UserData.logout();
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),

          if (!UserData.isLoggedIn)
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.app_registration, color: Color(0xFFD7C48A)),
                  title: const Text('Register', style: TextStyle(color: Color(0xFFD7C48A))),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.login, color: Color(0xFFD7C48A)),
                  title: const Text('Login', style: TextStyle(color: Color(0xFFD7C48A))),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}