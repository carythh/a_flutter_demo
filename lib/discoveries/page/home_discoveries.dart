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
        title: const Text('Provider Class'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Group 1 Title  Discoveries'),
                  subtitle: Text('Group 1 Subtitle  Discoveries'),
                ),
                ListTile(
                  title: Text('Group 2 Title  Discoveries'),
                  subtitle: Text('Group 2 Subtitle  Discoveries'),
                ),
                ListTile(
                  title: Text('Group 3 Title  Discoveries'),
                  subtitle: Text('Group 3 Subtitle Discoveries'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
