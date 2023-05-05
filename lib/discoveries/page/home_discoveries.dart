import 'package:a_flutter_demo/res/resources.dart';
import 'package:a_flutter_demo/util/toast_utils.dart';
import 'package:flutter/material.dart';

class HomeDiscoveriesPage extends StatefulWidget {
  const HomeDiscoveriesPage({super.key});

  @override
  _HomeDiscoveriesPageState createState() => _HomeDiscoveriesPageState();
}

class _HomeDiscoveriesPageState extends State<HomeDiscoveriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '发现',
          style: TextStyle(color: Colours.color_323232),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  Image.network(
                      'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
                      fit: BoxFit.cover),
                  Image.network(
                      'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
                      fit: BoxFit.cover),
                  Image.network(
                      'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
                      fit: BoxFit.cover),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 5,
              children: List.generate(10, (index) {
                return GestureDetector(
                    onTap: () {
                      // Handle tap event here
                      Toast.show("点击了第$index 个");
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.grey[300],
                      child: Image.network(
                          'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
                          fit: BoxFit.cover),
                    ));
              }),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Group $index'),
                  subtitle: Text('Description of group $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
