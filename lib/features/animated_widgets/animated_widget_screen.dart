import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedWidgetScreen extends StatefulWidget {
  const AnimatedWidgetScreen({super.key});

  @override
  State<AnimatedWidgetScreen> createState() => _AnimatedWidgetScreenState();
}

class _AnimatedWidgetScreenState extends State<AnimatedWidgetScreen> {
  double height = 200;
  double width = 200;
  double radius = 12;
  Color color = Colors.green;
  double scale = 0.5;
  Alignment alignment = Alignment.bottomLeft;
  final rnd = Random();

  bool showAdd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: () {
          height = rnd.nextInt(500).toDouble();
          color = Colors.orange;
          width = rnd.nextInt(500).toDouble();
          radius = rnd.nextInt(100).toDouble();

          alignment = [
            Alignment.topLeft,
            Alignment.bottomCenter,
            Alignment.bottomRight,
            Alignment.topRight,
            Alignment.center
          ][rnd.nextInt(5)];
          scale = rnd.nextDouble();
          showAdd = rnd.nextBool();
          setState(() {});
        },
        child: const Text(
          "Animate",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Animated Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: Icon(
                    showAdd ? Icons.add : Icons.remove,
                    size: 50,
                    color: Colors.green,
                  ),
                ),
                AnimatedContainer(
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(radius)),
                  height: height,
                  width: width,
                  duration: const Duration(seconds: 1),
                ),
                AnimatedScale(
                  scale: scale,
                  duration: const Duration(seconds: 1),
                  child: const Icon(
                    Icons.heart_broken_sharp,
                    color: Colors.red,
                    size: 100,
                  ),
                ),
                AnimatedRotation(
                  turns: scale,
                  duration: const Duration(seconds: 1),
                  child: const Icon(
                    Icons.face_retouching_natural_rounded,
                    size: 50,
                  ),
                ),
              ],
            ),
            AnimatedAlign(
              alignment: alignment,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(
                size: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
