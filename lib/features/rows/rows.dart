//Home Screen to show Row
import 'package:flutter/material.dart';

class HomeScreenRow extends StatefulWidget {
  const HomeScreenRow({super.key});

  @override
  State<HomeScreenRow> createState() => _HomeScreenRowState();
}

class _HomeScreenRowState extends State<HomeScreenRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rows"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 260,
              height: 200,
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 260,
              height: 200,
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 260,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
