import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_15/data/profile_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ProfileInfo>(context);

    return Scaffold(
        backgroundColor: userProvider.color ?? Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: const Text(
            "Profile",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 35,
                color: Colors.white,
                decorationColor: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.grey.shade800, width: 5),
                        color: Colors.white,
                        image: DecorationImage(
                          image: userProvider.image != null
                              ? FileImage(File(userProvider.image!))
                              : const AssetImage("assets/images/profile.png")
                                  as ImageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/secondPage');
                        },
                        child: const Text("Edit Profile")),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Name: Furkan Ayan",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                (userProvider.age == null)
                                    ? const Text("Age: (Did not specified)",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700))
                                    : Text(
                                        "Age: ${userProvider.age}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                
                              ]),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
