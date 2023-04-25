import 'package:flutter/material.dart';

class HomeSportsPage extends StatefulWidget {
  const HomeSportsPage({super.key});

  @override
  _HomeSportsPageState createState() => _HomeSportsPageState();
}

class _HomeSportsPageState extends State<HomeSportsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: PageView(
              children: [
                Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', fit: BoxFit.cover),
                Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', fit: BoxFit.cover),
                Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', fit: BoxFit.cover),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      'Grid Item $index',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),

    );
  }
}

