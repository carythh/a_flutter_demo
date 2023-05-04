import 'package:a_flutter_demo/res/resources.dart';
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
        title:  const Text('发现',style: TextStyle(color: Colours.color_323232) ,),
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
                return Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      'Grid Item $index',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                );
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
