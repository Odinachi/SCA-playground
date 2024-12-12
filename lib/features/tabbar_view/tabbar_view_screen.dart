import 'package:flutter/material.dart';
import 'package:secondapp/shared/app_colors.dart';
import 'package:secondapp/shared/constant.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Bar View Screen"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            height: 40,
            padding: const EdgeInsets.all(5),
            child: TabBar(
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.black,
              dividerColor: Colors.transparent,
              labelStyle: textStyle.copyWith(fontWeight: FontWeight.w700),
              unselectedLabelStyle:
                  textStyle.copyWith(fontWeight: FontWeight.w200),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.black,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Text("Pending"),
                Text("Ongoing"),
                Text("Completed"),
              ],
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              Center(
                child: Text("Pending Page"),
              ),
              Center(
                child: Text("Ongoing Page"),
              ),
              Center(
                child: Text("Completed Page"),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
