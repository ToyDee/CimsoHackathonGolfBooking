// screens/register.dart

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cimsohackathongolfbooking/widgets/Custom_navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedGender = 'Male';
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  final ScrollController _scrollController = ScrollController();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomNavbar(scaffoldKey: _scaffoldKey),
      drawer: CustomNavbar.buildDrawer(context),
      body: Stack(
        children: [

          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Image.asset(
                'assets/images/10.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),


          Container(color: Colors.black.withOpacity(0.15)),


          Center(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                width: MediaQuery.of(context).size.width > 600 ? 500 : MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD7C48A), width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Text(
                      'Create an Account',
                      style: TextStyle(
                        color: Color(0xFFD7C48A),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _profileImage == null
                              ? Colors.white.withOpacity(0.2)
                              : Colors.transparent,
                          border: Border.all(
                            color: const Color(0xFFD7C48A),
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (_profileImage != null)
                              ClipOval(
                                child: Image.file(
                                  _profileImage!,
                                  width: 96,
                                  height: 96,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (_profileImage == null)
                              const Icon(
                                Icons.add_a_photo,
                                color: Color(0xFFD7C48A),
                                size: 40,
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('First Name'),
                              _buildTextField(_firstNameController),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('Last Name'),
                              _buildTextField(_lastNameController),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Username'),
                    _buildTextField(_usernameController),
                    const SizedBox(height: 16),

                    _buildLabel('Password'),
                    _buildPasswordField(_passwordController),
                    const SizedBox(height: 16),

                    _buildLabel('Confirm Password'),
                    _buildPasswordField(_confirmPasswordController),
                    const SizedBox(height: 16),

                    _buildLabel('Date of Birth'),
                    Row(
                      children: [
                        Expanded(child: _buildNumberField('DD', _dayController, 2)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildNumberField('MM', _monthController, 2)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildNumberField('YYYY', _yearController, 4)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Mobile Number'),
                    _buildNumberField('Enter mobile number', _phoneController, 15),
                    const SizedBox(height: 16),

                    _buildLabel('Email'),
                    _buildTextField(_emailController),
                    const SizedBox(height: 16),

                    _buildLabel('Gender'),
                    IgnorePointer(
                      ignoring: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildGenderOption('Male'),
                          _buildGenderOption('Female'),
                          _buildGenderOption('Other'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD7C48A),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }

  Widget _buildNumberField(String hint, TextEditingController controller, int maxLength) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
          counterText: '',
        ),
        style: const TextStyle(color: Colors.black),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        maxLength: maxLength,
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFD7C48A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _selectedGender == gender
              ? const Color(0xFFD7C48A)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xFFD7C48A),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedGender == gender)
              const Icon(Icons.check, color: Colors.black, size: 16),
            const SizedBox(width: 4),
            Text(
              gender,
              style: TextStyle(
                color: _selectedGender == gender ? Colors.black : const Color(0xFFD7C48A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}