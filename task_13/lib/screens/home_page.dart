import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = List.generate(16, (index) => "Item ${index + 1}");
  List<String> itemsNow = [];
  bool isLoading = false;
  int currentPage = 1;
  int itemsPerPage = 4;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    getPageItems(currentPage);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (items.length != itemsNow.length) {
        setState(() {
          currentPage++;

        });
      }
      print(currentPage);
      getPageItems(currentPage);
    }
  }

  Future<void> getPageItems(int page) async{
    setState(() {
      isLoading = true;
    });
    if (itemsNow.length >= items.length) {
      return;
    }
    await Future.delayed(const Duration(seconds: 2));
    int startIndex = (page - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    if (endIndex > items.length) {
      endIndex = items.length;
    }
    itemsNow.addAll(items.sublist(startIndex, endIndex));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScrollView"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: itemsNow.length,
              itemBuilder: (context, index) {
                print('$index , ${itemsNow.length}');
                if (index == itemsNow.length && index != items.length) {
                  print("GİRDİ");
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  margin: const EdgeInsets.all(15),
                  height: 200,
                  width: 200,
                  color: Colors.orange,
                  child: Center(child: Text(itemsNow[index])),
                );
              },
            ),
          ),
          if(isLoading && itemsNow.length != items.length)CircularProgressIndicator(),
        ],
      ),
    );
  }
}
