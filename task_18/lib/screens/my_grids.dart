import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_18/data/app_data.dart';

class MyGrids extends StatefulWidget {
  final int index;
  const MyGrids({super.key, required this.index});

  @override
  State<MyGrids> createState() => _MyGridsState();
}

class _MyGridsState extends State<MyGrids> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return Column(
      children: [
        Container(
          height: 125,
          width: 125,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue.shade700),
            borderRadius: BorderRadius.circular(45),
          ),
          child: CupertinoContextMenu(
            actions: [
              CupertinoContextMenuAction(
                child: const Text("See the Details"),
                onPressed: () {
                  Navigator.pushNamed(context, '/detailPage',
                      arguments: widget.index);
                },
              )
            ],
            child: Container(
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                    image: AssetImage(appDatas[widget.index].imagePath),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detailPage',
                  arguments: widget.index);
                setState(() {
                  isSelected = !isSelected;
                });
            },
            child: Text(appDatas[widget.index].name)),
      ],
    );
  }
}
