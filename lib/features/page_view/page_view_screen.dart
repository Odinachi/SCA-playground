import 'package:flutter/material.dart';

import '../columns/column.dart';
import '../gridview/grid_view.dart';
import '../gridview/grid_view_builder.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final _pageController = PageController();

  List list = [
    const HomeScreenColumn(),
    const GridViewScreen(),
    const GridViewBuilderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View Screen'),
      ),
      body: PageView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _pageController,
        itemBuilder: (_, index) {
          final each = list[index];
          return each;
        },
        itemCount: list.length,
      ),
    );
  }
}
