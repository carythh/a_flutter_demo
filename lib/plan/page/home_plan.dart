import 'package:flutter/material.dart';

class HomePlanPage extends StatefulWidget {
  const HomePlanPage({super.key});

  @override
  _HomePlanPageState createState() => _HomePlanPageState();
}

class _HomePlanPageState extends State<HomePlanPage> {
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
                  title: Text('Group 1 Title'),
                  subtitle: Text('Group 1 Subtitle'),
                ),
                ListTile(
                  title: Text('Group 2 Title'),
                  subtitle: Text('Group 2 Subtitle'),
                ),
                ListTile(
                  title: Text('Group 3 Title'),
                  subtitle: Text('Group 3 Subtitle'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
