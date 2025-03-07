import 'package:flutter/cupertino.dart';

class MenuModel {
  final IconData icon;
  final String title;
  final Widget? page; // Make this nullable
  final List<MenuModel>? subItems;

  const MenuModel({
    required this.icon,
    required this.title,
    this.page,
    this.subItems,
  });
}
