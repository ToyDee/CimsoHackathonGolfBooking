import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/custom_navbar.dart'; // Import CustomNavbar

void main() {
  runApp(ProfileEditApp());
}

class ProfileEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileEditPage(),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  String selectedGender = 'Male';
  File? _profileImage;
  bool _isPasswordVisible = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    bioController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    // Simulating saving profile data
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile Saved Successfully!")),
    );
  }

  void _clearForm() {
    setState(() {
      firstNameController.clear();
      lastNameController.clear();
      usernameController.clear();
      passwordController.clear();
      emailController.clear();
      phoneController.clear();
      bioController.clear();
      selectedGender = 'Male';
      _profileImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomNavbar(scaffoldKey: _scaffoldKey), // Use CustomNavbar
      drawer: CustomNavbar.buildDrawer(context), // Add drawer functionality
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null ? Icon(Icons.person, size: 50, color: Colors.black54) : null,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text("Change Photo"),
              ),
              SizedBox(height: 20),

              // Form Fields
              buildTextField("First Name", firstNameController),
              buildTextField("Last Name", lastNameController),
              buildTextField("Username", usernameController),
              buildTextField("Email", emailController),
              buildTextField("Phone", phoneController),
              buildTextField("Password", passwordController, isPassword: true),

              // Bio Field
              TextField(
                controller: bioController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Bio",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: _clearForm,
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: _saveProfile,
                    child: Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? !_isPasswordVisible : false,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}