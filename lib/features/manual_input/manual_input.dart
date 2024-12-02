import 'package:flutter/material.dart';

class ManualInput extends StatelessWidget {
  const ManualInput({super.key, required this.arg});

  final ManualInputArg arg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, b) {
          print("User actually popped from here");
        },
        child: Center(
          child: Text(arg.pageContent),
        ),
      ),
      appBar: AppBar(
        title: Text(arg.pageTitle),
      ),
    );
  }
}

class ManualInputArg {
  final String pageTitle;
  final String pageContent;

  ManualInputArg({required this.pageTitle, required this.pageContent});
}
