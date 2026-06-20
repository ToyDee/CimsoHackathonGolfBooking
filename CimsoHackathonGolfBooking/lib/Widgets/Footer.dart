// widgets/footer.dart
// 6509929_Lin_Nay_Wun

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _enquiryController = TextEditingController();
  bool _showSuccessMessage = false;

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _showSuccessMessage = true;
      });
      // Clear the form
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _enquiryController.clear();
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          _showSuccessMessage = false;
        });
      });
    }
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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Us',
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
                            Container(
                              height: 360,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pioneer Golf Club',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFD7C48A),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    '247 Leichhardt Rd, Mirani QLD 4754 Australia',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFD7C48A),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '+66956493727',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFD7C48A),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.facebook, color: Color(0xFFD7C48A)),
                                        onPressed: () => _launchURL('https://facebook.com'),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.camera_alt, color: Color(0xFFD7C48A)),
                                        onPressed: () => _launchURL('https://instagram.com'),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.mail, color: Color(0xFFD7C48A)),
                                        onPressed: () => _launchURL('mailto:info@pioneergolf.com.au'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Contact Us',
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
                            Container(
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
                              child: SingleChildScrollView(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _firstNameController,
                                              decoration: const InputDecoration(
                                                labelText: 'First Name',
                                                labelStyle: TextStyle(color: Color(0xFFD7C48A)),
                                                border: OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                                ),
                                              ),
                                              style: const TextStyle(color: Color(0xFFD7C48A)),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter your first name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: TextFormField(
                                              controller: _lastNameController,
                                              decoration: const InputDecoration(
                                                labelText: 'Last Name',
                                                labelStyle: TextStyle(color: Color(0xFFD7C48A)),
                                                border: OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                                ),
                                              ),
                                              style: const TextStyle(color: Color(0xFFD7C48A)),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter your last name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        controller: _emailController,
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: TextStyle(color: Color(0xFFD7C48A)),
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                          ),
                                        ),
                                        style: const TextStyle(color: Color(0xFFD7C48A)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                            return 'Please enter a valid email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        controller: _enquiryController,
                                        decoration: const InputDecoration(
                                          labelText: 'Enquiry...',
                                          labelStyle: TextStyle(color: Color(0xFFD7C48A)),
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                          ),
                                        ),
                                        maxLines: 4,
                                        style: const TextStyle(color: Color(0xFFD7C48A)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your enquiry';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: _handleSubmit,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFD7C48A),
                                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: const Text(
                                          'Submit',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      if (_showSuccessMessage)
                                        const Padding(
                                          padding: EdgeInsets.only(top: 16),
                                          child: Text(
                                            'Your enquiry has been sent!',
                                            style: TextStyle(
                                              color: Color(0xFFD7C48A),
                                              fontSize: 16,
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
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About Us',
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
                      Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pioneer Golf Club',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFD7C48A),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '247 Leichhardt Rd, Mirani QLD 4754 Australia',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFD7C48A),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '+66956493727',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFD7C48A),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.facebook, color: Color(0xFFD7C48A)),
                                  onPressed: () => _launchURL('https://facebook.com'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.camera_alt, color: Color(0xFFD7C48A)),
                                  onPressed: () => _launchURL('https://instagram.com'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.mail, color: Color(0xFFD7C48A)),
                                  onPressed: () => _launchURL('mailto:info@pioneergolf.com.au'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact Us',
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
                      Container(
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
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _firstNameController,
                                        decoration: const InputDecoration(
                                          labelText: 'First Name',
                                          labelStyle: TextStyle(color: Color(0xFFD7C48A)),
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                          ),
                                        ),
                                        style: const TextStyle(color: Color(0xFFD7C48A)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your first name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _lastNameController,
                                        decoration: const InputDecoration(
                                          labelText: 'Last Name',
                                          labelStyle: TextStyle(color: Color(0xFFD7C48A)),
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                          ),
                                        ),
                                        style: const TextStyle(color: Color(0xFFD7C48A)),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your last name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Color(0xFFD7C48A)),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                    ),
                                  ),
                                  style: const TextStyle(color: Color(0xFFD7C48A)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _enquiryController,
                                  decoration: const InputDecoration(
                                    labelText: 'Enquiry...',
                                    labelStyle: TextStyle(color: Color(0xFFD7C48A)),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFFD7C48A)),
                                    ),
                                  ),
                                  maxLines: 4,
                                  style: const TextStyle(color: Color(0xFFD7C48A)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your enquiry';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _handleSubmit,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD7C48A),
                                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                if (_showSuccessMessage)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text(
                                      'Your enquiry has been sent!',
                                      style: TextStyle(
                                        color: Color(0xFFD7C48A),
                                        fontSize: 16,
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
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        }
      },
    );
  }
}