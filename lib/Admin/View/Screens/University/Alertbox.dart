
import 'package:course_connect/Admin/View/Screens/University/AddUniversity.dart';
import 'package:course_connect/Admin/View/Screens/University/Universitymain.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';

class Alertbox extends StatefulWidget {
  const Alertbox({super.key});

  @override
  State<Alertbox> createState() => _AlertboxState();
}

class _AlertboxState extends State<Alertbox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        width: 730,
        height: 500,
        child: University_main(), // Ensure this widget fits properly
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("Close"),
        ),
      ],
    );
  }
}
