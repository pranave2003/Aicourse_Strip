import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  String hintText;
  Widget prefixIcon;
  Widget? suffixIcon;
  TextEditingController? controller;

  CustomTextForm({super.key, this.suffixIcon, required this.prefixIcon,required this.hintText, this.controller,});

  get formlconColor => null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey[400],
          filled: true,
          prefixIconColor: formlconColor,

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border:
          OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
          )),
    );
  }
}
