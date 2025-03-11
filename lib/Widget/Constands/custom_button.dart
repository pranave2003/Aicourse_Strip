
import 'package:flutter/material.dart';

import 'colors.dart';


class CustomButton extends StatelessWidget {
  Function() onPressed;
  String label;
  double radius;
   CustomButton({super.key,required this.onPressed,required this.label,this.radius = 10, required String text, required MaterialColor textColor, required MaterialColor borderColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      color: blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius)
      ),
      onPressed:onPressed ,child: Text(label,style: TextStyle(fontSize: 20,color: Colors.white),),);
  }
}
