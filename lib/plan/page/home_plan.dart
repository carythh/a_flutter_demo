import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class HomePlanPage extends StatefulWidget {
  const HomePlanPage({super.key});

  @override
  _HomePlanPageState createState() => _HomePlanPageState();
}
// Initialize the ScrollController
final _scrollController = ScrollController();
var _dataList = List.generate(10, (index) => 'Item $index');
// Add the onEndReached callback function to load more data
void _loadMoreData() {
  // Load more data here
  _dataList.addAll(List.generate(10, (index) => 'Item $index'));
}



class _HomePlanPageState extends State<HomePlanPage> {
  @override
  void initState() {
    super.initState();
    // Add a listener to the ScrollController to detect when the user has scrolled to the end of the list
    _scrollController.addListener(() {
      LogUtil.e("load more data pixels=${_scrollController.position.pixels},maxScrollExtent=${_scrollController.position.maxScrollExtent}");
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreData();
        LogUtil.e("load more data");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body:  RefreshIndicator(
        onRefresh: () async {
          // Handle refresh event here
          LogUtil.e("onRefresh data");
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount:_dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', fit: BoxFit.cover),
              title: Text(_dataList[index]),
              subtitle: Text('Description of group $index'),
            );
          },
        ),
      ),
    );
  }
}
