import 'package:flutter/material.dart';
import 'package:task_16/screens/home_page.dart';
import 'package:task_16/screens/user_view.dart';

void main() {
  runApp( MaterialApp(
    title: "DataTable",
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => const HomePage(),
      '/userView':(context) => const UserView(),
    },
    initialRoute: '/',
  ));
}
