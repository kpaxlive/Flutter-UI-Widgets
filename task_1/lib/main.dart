import 'package:asdasd/components/image_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "IMAGE GALLERY",
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 153, 221, 255),
            title: Text(
              "IMAGE GALLERY",
              style: GoogleFonts.aBeeZee(
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 25)),
            ),
            expandedHeight: 300,
            pinned: true,
            floating: false,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 175, bottom: 20),
                child: SizedBox(
                  height: 100,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/profile.jpeg"),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const ImageContainers();
            },
            childCount: 5,
          )),
        ],
      ),
    );
  }
}
