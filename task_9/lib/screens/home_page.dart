import 'package:flutter/material.dart';
import 'package:task_9/components/button_1.dart';
import 'package:task_9/components/button_2.dart';
import 'package:task_9/components/button_3.dart';
import 'package:task_9/components/button_4.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonOne(),

            SizedBox(height: 20,),

            ButtonTwo(),

            SizedBox(height: 20,),
            
            ButtonThree(),

            SizedBox(height: 20,),

            ButtonFour(),
          ],
        ),
      ),
    );
  }
}
