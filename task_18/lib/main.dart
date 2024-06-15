import 'package:flutter/material.dart';
import 'package:task_18/screens/detail_page.dart';
import 'package:task_18/screens/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "GridView",
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      '/detailPage': (context) => const DetailPage(),
    },
    theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
    initialRoute: '/',
  ));
}
