import 'package:flutter/material.dart';
import 'package:task_15/data/profile_info.dart';
import 'package:task_15/screens/fifth_page.dart';
import 'package:task_15/screens/fourth_page.dart';
import 'package:task_15/screens/home_page.dart';
import 'package:task_15/screens/second_page.dart';
import 'package:task_15/screens/third_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ProfileInfo(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pickers",
      theme: ThemeData(
        fontFamily: context.watch<ProfileInfo>().font ?? "Roboto",
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/secondPage': (context) => const SecondPage(),
        '/thirdPage': (context) => const ThirdPage(),
        '/fourthPage': (context) => const FourthPage(),
        '/fifthPage': (context) => const FifthPage(),
      },
      initialRoute: '/',
    );
      }
  }
