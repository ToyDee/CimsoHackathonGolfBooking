// models/user_data.dart

class UserData {
  static String firstName = '';
  static String lastName = '';
  static bool isLoggedIn = false;

  static void login(String fname, String lname) {
    firstName = fname;
    lastName = lname;
    isLoggedIn = true;
  }

  static void logout() {
    firstName = '';
    lastName = '';
    isLoggedIn = false;
  }
}