import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_15/data/profile_info.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ProfileInfo>(context);
    return Scaffold(
      backgroundColor: userProvider.color ?? Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,), onPressed: () => Navigator.pop(context),),
        title: const Text(
          "Choose Your Theme",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 35,
              color: Colors.white,
              decorationColor: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: ColorPicker(onColorChanged: (Color color) {
                  userProvider.setColor(color);
                }),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fifthPage');
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
