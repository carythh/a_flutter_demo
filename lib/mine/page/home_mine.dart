import 'package:flutter/material.dart';

class HomeMinePage extends StatefulWidget {
  const HomeMinePage({super.key});

  @override
  _HomeMinePageState createState() => _HomeMinePageState();
}

class _HomeMinePageState extends State<HomeMinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Group 1 Title mine'),
                  subtitle: Text('Group 1 Subtitle mine'),
                ),
                ListTile(
                  title: Text('Group 2 Title mine'),
                  subtitle: Text('Group 2 Subtitle mine'),
                ),
                ListTile(
                  title: Text('Group 3 Title mine'),
                  subtitle: Text('Group 3 Subtitle mine'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
