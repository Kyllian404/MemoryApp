import 'package:flutter/material.dart';

class HomeIconData {
  HomeIconData(
      {required this.color1,
      required this.color2,
      required this.icon,
      required this.onTap});

  final Color color1;
  final Color color2;
  final IconData icon;
  final void Function() onTap;
}
