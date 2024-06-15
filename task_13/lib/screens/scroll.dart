import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final List<String> _allItems =
      List.generate(12, (index) => 'Item ${index + 1}');
  final List<String> _displayedItems = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  final int _itemsPerPage = 4;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  Future<void> _loadMoreData() async {
    if (!_isLoading && _displayedItems.length < _allItems.length) {
      if (_displayedItems.isNotEmpty) {
        setState(() {
          _isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 2));
      }
      setState(() {
        _displayedItems.addAll(
            _allItems.skip(_currentPage * _itemsPerPage).take(_itemsPerPage));
        _currentPage++;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite ListView'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 500,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _displayedItems.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  print(index);
                  if (index == _allItems.length - 1) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Last Index"),
                              content: const Text("You have reached end of the list"),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("OK")),
                              ],
                            );
                          });
                    });
                  }
                  if (index  == _displayedItems.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.all(15),
                    height: 200,
                    width: 200,
                    color: Colors.orange,
                    child: Center(child: Text(_displayedItems[index])),
                  );
                },
              ),
            ),
          ),
          if (_isLoading) const CircularProgressIndicator(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
