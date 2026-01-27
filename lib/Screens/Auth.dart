import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(home: AuthScreen(), debugShowCheckedModeBanner: false),
);

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Logic Variables
  bool isLogin = true;
  String? selectedGender; // Stores 'M' or 'F'
  String? selectedCourse; // Stores the chosen course

  // List of courses for the dropdown
  final List<String> courses = [
    'HND Computer Science',
    'HND Electrical Engineering',
    'B-Tech Information Technology',
    'B-Tech Civil Engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 5, 105),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // Increased margin makes the container smaller/slimmer
            margin: const EdgeInsets.symmetric(horizontal: 50),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // TAB SWITCHER (Login / Signup)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navTab("Login", isLogin),
                    _navTab("Sign up", !isLogin),
                  ],
                ),
                const SizedBox(height: 20),

                // DYNAMIC FORM FIELDS
                if (isLogin) ...[
                  _underlineInput("Index num"),
                  _underlineInput("Password", hideText: true),
                ] else ...[
                  _underlineInput("Name"),
                  _underlineInput("Index"),

                  // DROPDOWN FOR COURSES
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      hintText: "Select Course",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    value: selectedCourse,
                    items: courses.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // We use setState so the UI shows the selected item
                      setState(() => selectedCourse = newValue);
                    },
                  ),

                  _underlineInput("Number"),
                  _underlineInput("Password", hideText: true),

                  // GENDER SELECTION (Fixed Ticking)
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text(
                        "Gender: ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      // Male Checkbox
                      Checkbox(
                        value: selectedGender == "M",
                        onChanged: (val) =>
                            setState(() => selectedGender = "M"),
                      ),
                      const Text("M"),
                      // Female Checkbox
                      Checkbox(
                        value: selectedGender == "F",
                        onChanged: (val) =>
                            setState(() => selectedGender = "F"),
                      ),
                      const Text("F"),
                    ],
                  ),
                ],

                const SizedBox(height: 30),

                // BLUE ACTION BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print(
                        "Button Pressed for ${isLogin ? 'Login' : 'Signup'}",
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(isLogin ? "LOGIN" : "SIGN UP"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper for Navigation Tabs
  Widget _navTab(String label, bool active) {
    return GestureDetector(
      onTap: () => setState(() => isLogin = (label == "Login")),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: active ? Colors.blue : Colors.grey,
          decoration: active ? TextDecoration.underline : null,
        ),
      ),
    );
  }

  // Helper for Underline Input Fields
  Widget _underlineInput(String hint, {bool hideText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        obscureText: hideText,
        decoration: InputDecoration(
          hintText: hint,
          // Removes the box and adds just the bottom line
          border: InputBorder.none,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
