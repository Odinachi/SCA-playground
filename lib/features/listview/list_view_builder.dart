import 'package:flutter/material.dart';

class HomeListViewBuilder extends StatefulWidget {
  const HomeListViewBuilder({super.key});

  @override
  State<HomeListViewBuilder> createState() => _HomeListViewBuilderState();
}

class _HomeListViewBuilderState extends State<HomeListViewBuilder> {
  List<String> names = [
    "Abisola",
    "Kelechi",
    "Ganiyu",
    "Abibat",
    "Amoke",
    "Chinedu",
    "Francis",
    "Kafayat",
    "Kemi",
    "Precious"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          names.addAll(List.from(names));
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text("List View Builder"),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.red.withOpacity(.2)),
            child: Text(
              names[index],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
        itemCount: names.length,
        separatorBuilder: (_, __) => const Divider(
          height: 30,
          thickness: 10,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
