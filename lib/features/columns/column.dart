//Home Screen to show Column
import 'package:flutter/material.dart';

class HomeScreenColumn extends StatefulWidget {
  const HomeScreenColumn({super.key});

  @override
  State<HomeScreenColumn> createState() => _HomeScreenColumnState();
}

class _HomeScreenColumnState extends State<HomeScreenColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.exit_to_app),
        ),
        title: Text("Column View"),
        actions: [
          Icon(
            Icons.call,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.video_call,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
            height: 100,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
              height: 100,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            height: 100,
          ),
        ],
      ),
    );
  }
}
