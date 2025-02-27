//widget
import 'package:flutter/material.dart';


import 'colors.dart';

class CustomTextForm extends StatelessWidget {
  String hintText;
  Widget prefixIcon;
  TextEditingController? controller;

  CustomTextForm({super.key,required this.prefixIcon, required this.hintText, this.controller,});

  get formIconColor => null;

  get formColor => null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIconColor: formIconColor,
          prefixIcon: prefixIcon,
          fillColor: formColor,
          filled: true,
          border:
          OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
          )),
    );
  }
}


class WashFold extends StatelessWidget {
  String icon;
  String title;
  String title2;
  WashFold({super.key, required this.icon, required this.title,required this.title2});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {},
      child: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child:
              Image.asset(icon),
            ),
          ),
          SizedBox(height: 5,),
          Text(title,textAlign: TextAlign.center,),
        ],
      ),
    );

  }}