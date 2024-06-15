
import 'package:flutter/material.dart';
import 'package:task_2/components/custom_button.dart';
import 'package:task_2/components/my_button.dart';
import 'package:task_2/components/popup_button.dart';
import 'package:task_2/components/shaking_button.dart';
import 'package:task_2/components/two_buttons.dart';

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
            PopupButton(),
            SizedBox(height: 20),
            MyButton(),
            SizedBox(height: 20),
            CustomButton(),
            SizedBox(height: 20),
            TwoButtons(),
            SizedBox(height: 20),
            ShakingButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
