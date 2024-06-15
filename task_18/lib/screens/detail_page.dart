import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:launch_review/launch_review.dart';
import 'package:task_18/data/app_data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;
    List<AppData> ourApps = appDatas;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        title: const Text("App Details"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.blue.shade400),
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                    image: AssetImage(ourApps[args].imagePath),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              height: 250,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(width: 3, color: Colors.blue.shade500),
                  borderRadius: BorderRadius.circular(35)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${ourApps[args].name}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text("Release Date: ${ourApps[args].releaseDate}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Text("App Category: ${ourApps[args].name}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/app-store.png", height: 35),
                      TextButton(
                        child: const Text(
                          "See in AppStore",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        onPressed: () => LaunchReview.launch(
                          iOSAppId: "1527756593",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
