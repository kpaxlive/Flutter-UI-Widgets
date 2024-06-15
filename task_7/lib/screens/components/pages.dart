import 'package:flutter/material.dart';
import 'package:task_7/data/page_data.dart';

class Views extends StatelessWidget {
  final Pages herePages;
  const Views({super.key, required this.herePages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey.shade200,
                title: Text(
                  herePages.title!,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 150, bottom: 240, right: 15, left: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(color: Colors.grey.shade200, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ]),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Text(herePages.subtitle!,
                            style: TextStyle(
                                color: herePages.color,
                                fontSize: 27,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 35,
                        ),
                        Image.asset(
                          herePages.image!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}