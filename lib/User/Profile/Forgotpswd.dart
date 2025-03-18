import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Forgotpswd(),
    );
  }
}

class Forgotpswd extends StatelessWidget {
  Forgotpswd({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(true);
  final ValueNotifier<bool> confirmPasswordVisible = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Set a new password",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Create a new password. Ensure it differs from previous ones for security",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildPasswordField("Password", passwordController, passwordVisible),
            const SizedBox(height: 16),
            _buildPasswordField("Confirm Password", confirmPasswordController, confirmPasswordVisible),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Update Password",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller, ValueNotifier<bool> visibility) {
    return ValueListenableBuilder(
      valueListenable: visibility,
      builder: (context, value, child) {
        return TextField(
          controller: controller,
          obscureText: value,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: IconButton(
              icon: Icon(value ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                visibility.value = !visibility.value;
              },
            ),
          ),
        );
      },
    );
  }
}