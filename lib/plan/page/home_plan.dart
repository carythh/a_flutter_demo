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
            return _getBottomItem(Icons.cake, _dataList[index]);
            //   ListTile(
            //   leading: Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', fit: BoxFit.cover),
            //   title: Text(_dataList[index]),
            //   subtitle: Text('Description of group $index'),
            // );
          },
        ),
      ),
    );
  }


  ///返回一个居中带图标和文本的Item
  _getBottomItem(IconData icon, String text) {
    ///充满 Row 横向的布局
    return Expanded(
      flex: 1,
      ///居中显示
      child: Center(
        ///横向布局
        child: Row(
          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,
          ///大小按照最大充满
          mainAxisSize : MainAxisSize.max,
          ///竖向也居中
          crossAxisAlignment : CrossAxisAlignment.center,
          children: <Widget>[
            ///一个图标，大小16.0，灰色
            Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),
            ///间隔
            const Padding(padding: EdgeInsets.only(left:5.0)),
            ///显示文本
            Text(
              text,
              //设置字体样式：颜色灰色，字体大小14.0
              style: const TextStyle(color: Colors.grey, fontSize: 14.0),
              //超过的省略为...显示
              overflow: TextOverflow.ellipsis,
              //最长一行
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }



}
