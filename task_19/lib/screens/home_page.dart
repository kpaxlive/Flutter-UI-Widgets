import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My SliverList"),
      ),
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  title: Center(child: Text(index.toString())),
                  tileColor: Colors.blue,
                ),
              );
            },
            childCount: 5,
          ),
        ),
        SliverGrid.builder(
          itemCount: 20,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    width: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/article.png"),
                    )),
                  ),
                  Text("Article ${index+1}")
                ],
              ),
            );
          },
        )
      ]),
    );
  }
}
