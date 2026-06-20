import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart'; // Use CustomNavbar

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

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
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/golf_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                          'Email Verification',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'We have sent an OTP code to your email\nexample@gmail.com.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFF5DEB3)),
                        ),
                        const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: 60,
                              child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (value) => _onChanged(value, index),
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/changepassword');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Verify Account',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFF5DEB3)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Didn't receive code? Resend OTP in 60s",
                          style: TextStyle(color: Color(0xFFF5DEB3), fontSize: 14, fontWeight: FontWeight.w400),
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