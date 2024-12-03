import 'package:flutter/material.dart';

class HomeScreenListView extends StatefulWidget {
  const HomeScreenListView({super.key});

  @override
  State<HomeScreenListView> createState() => _HomeScreenListViewState();
}

class _HomeScreenListViewState extends State<HomeScreenListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(color: Colors.yellow),
          ),
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(color: Colors.red),
          ),
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
