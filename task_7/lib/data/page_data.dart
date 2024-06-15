



import 'package:flutter/material.dart';

class Pages
{
  final String? title;
  final String? subtitle;
  final String? image;
  final Color? color;

  Pages({required this.title, required this.subtitle, required this.image, required this.color});
}


List<Pages> pages = [
  Pages(title: "Norway", subtitle: "Lakeview", image: "assets/images/norway0.jpeg", color: Colors.black),
  Pages(title: "Norway", subtitle: "Snowy Town", image: "assets/images/norway1.jpeg", color: Colors.blue),
  Pages(title: "Norway", subtitle: "Village", image: "assets/images/norway2.jpeg", color: Colors.purple),
  Pages(title: "Norway", subtitle: "Green Town", image: "assets/images/norway3.jpeg", color: Colors.green),
];