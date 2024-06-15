import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task_15/data/profile_info.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ProfileInfo>(context);

    return Scaffold(
      backgroundColor: userProvider.color ?? Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,), onPressed: () => Navigator.pop(context),),
        title: const Text(
          "Choose Your Picture",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 35,
              color: Colors.white,
              decorationColor: Colors.white),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            final pickedFile = await ImagePicker().pickImage(
              source: ImageSource.gallery,
              imageQuality: 80,
            );

            if (pickedFile != null) {
              userProvider.setImage(pickedFile.path);
              Navigator.pushNamed(context, '/thirdPage');
            }
          },
          child: Stack(fit: StackFit.passthrough, children: [
            Center(
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 5),
                    color: Colors.white,
                    image: DecorationImage(
                      image: userProvider.image != null
                          ? FileImage(File(userProvider.image!))
                          : const AssetImage(
                              "assets/images/profile.png",
                            ) as ImageProvider,
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            Center(
              child: Image.asset(
                "assets/images/camera.png",
                height: 100,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
