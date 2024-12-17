import 'package:flutter/material.dart';

class ExpansionTileScreen extends StatefulWidget {
  const ExpansionTileScreen({super.key});

  @override
  State<ExpansionTileScreen> createState() => _ExpansionTileScreenState();
}

class _ExpansionTileScreenState extends State<ExpansionTileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansion Tile"),
      ),
      body: Column(
        children: [
          ExpansionTile(
            trailing: Icon(Icons.add),
            textColor: Colors.red,
            title: Text("Click here to read more..."),
            children: [
              ListTile(
                title: Text("Child 1"),
              ),
              ListTile(
                title: Text("Child 1"),
              ),
              ListTile(
                title: Text("Child 1"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
