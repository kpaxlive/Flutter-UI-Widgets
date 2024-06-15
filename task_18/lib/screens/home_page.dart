import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_18/data/app_data.dart';
import 'package:task_18/screens/my_grids.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double itemSize = 0.9;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        title: const Text("Our Apps",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                itemSize += 0.1;
                if (itemSize > 0.95) {
                  itemSize = 0.95;
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                itemSize -= 0.1;
                if (itemSize < 0.1) {
                  itemSize = 0.1;
                }
              });
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _addApps();
        },
        child: GridView.builder(
          itemCount: appDatas.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: itemSize,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return MyGrids(index: index);
          },
        ),
      ),
    );
  }

  Future _addApps() async {
    setState(() {
      appDatas.add(AppData(
          "New App",
          "04.05.2024",
          'https://apps.apple.com/tr/app/pdf-converter-reader-editor/id1623317186',
          "assets/images/flutter.png"));
    });
  }
}
