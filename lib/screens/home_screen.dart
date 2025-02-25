import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/mobile_animation.dart';
import '../utils/storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String savedEmail = "";
  String savedPassword = "";

  void _saveData() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter both email and password!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      savedEmail = email;
      savedPassword = password;
    });

    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                const Text(
                  "Flutter Form",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Animation
                const MobileAnimation(),
                const SizedBox(height: 30),

                // Input Card
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        const SizedBox(height: 15),
                        InputField(controller: emailController, hintText: "Enter Email"),
                        const SizedBox(height: 10),
                        InputField(controller: passwordController, hintText: "Enter Password", isPassword: true),
                        const SizedBox(height: 20),

                        // Save Button
                        GestureDetector(
                          onTap: _saveData,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: [Color(0xFFff9966), Color(0xFFff5e62)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Save",
                                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Output Section
                const Text(
                  "Output",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),

                if (savedEmail.isNotEmpty && savedPassword.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text("E-mail: $savedEmail", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Password: $savedPassword", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
