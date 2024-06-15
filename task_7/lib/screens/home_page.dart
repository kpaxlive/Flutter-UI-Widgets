import 'package:flutter/material.dart';
import 'package:task_7/data/page_data.dart';
import 'package:task_7/screens/components/pages.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = PageController();
  final pageList = pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          itemCount: pages.length,
          itemBuilder: (context, index) {
          Pages current = pageList[index];
            return Views(herePages: current);
          },
        ),
      ),
    );
  }
}
