import 'package:flutter/material.dart';

class AnimatedWidgetScreen extends StatefulWidget {
  const AnimatedWidgetScreen({super.key});

  @override
  State<AnimatedWidgetScreen> createState() => _AnimatedWidgetScreenState();
}

class _AnimatedWidgetScreenState extends State<AnimatedWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Widget"),
      ),
      body: const Placeholder(),
    );
  }
}
