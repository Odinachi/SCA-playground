import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream builder"),
      ),
      body: StreamBuilder(
          stream: _stringStream(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Text("Error encountered");
            }
            if (snapshot.data?.isEmpty ?? false) {
              return const Center(child: Text("Empty"));
            }

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Last text is ${snapshot.data}"),
              ),
            );
          }),
    );
  }

  Stream<String> _stringStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      yield WordGenerator().randomSentence(10);
    }
  }
}
