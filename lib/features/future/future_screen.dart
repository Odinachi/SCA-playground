import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future"),
      ),
      body: FutureBuilder(
          future: _fetchWordsAsync(),
          builder: (BuildContext _, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              WidgetsBinding.instance.addPostFrameCallback((a) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(snapshot.error.toString())));
              });
              return const Center(child: Text("There was an error "));
            } else if (snapshot.data?.isEmpty ?? false) {
              return const Center(child: Text("Generated Text is empty "));
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                snapshot.data ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            );
          }),
    );
  }

  Future<String> _fetchWordsAsync() async {
    await Future.delayed(const Duration(seconds: 10), () {
      print("10 seconds elapsed");
    });
    return WordGenerator().randomSentence(100);
  }
}
