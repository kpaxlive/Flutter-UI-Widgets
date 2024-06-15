import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Color> colors = [
    Colors.deepPurple.shade200,
    Colors.deepOrange.shade200,
    Colors.blue.shade300,
    Colors.green.shade200
  ];

  Color indicatorColor = Colors.deepPurple.shade200;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      indicatorColor = colors[_tabController.index];
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("TABBAR"),
          ),
          body: Column(
            children: [
              TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 3,
                  dividerColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white),
                    color: indicatorColor,
                  ),
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.home,
                        color: (_tabController.index == 0)
                            ? Colors.blue[800]
                            : Colors.grey.shade400,
                      ),
                      child: const Text("Home"),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.favorite,
                        color: (_tabController.index == 1)
                            ? Colors.purple[800]
                            : Colors.grey.shade400,
                      ),
                      child: const Text("Favorites"),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.thumb_up_rounded,
                        color: (_tabController.index == 2)
                            ? Colors.green[800]
                            : Colors.grey.shade400,
                      ),
                      child: const Text("Liked"),
                    ),
                    Tab(
                        icon: Icon(
                          Icons.bookmark_outlined,
                          color: (_tabController.index == 3)
                              ? Colors.red
                              : Colors.grey.shade400,
                        ),
                        child: const Text("Saved")),
                  ]),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Container(
                      color: Colors.orange.shade400,
                      child: const Center(child: Text("1st Page"))),
                  Container(
                      color: Colors.red.shade400,
                      child: const Center(child: Text("2nd Page"))),
                  Container(
                      color: Colors.blue.shade400,
                      child: const Center(child: Text("3rd Page"))),
                  Container(
                    color: Colors.pink,
                    child: const Center(child: Text("4th Page")),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
