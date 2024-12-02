import 'package:flutter/material.dart';
import 'package:secondapp/features/Navigation/route_strings.dart';
import 'package:secondapp/features/Navigation/router.dart';
import 'package:secondapp/features/manual_input/manual_input.dart';
import 'package:secondapp/features/rows/rows.dart';

import '../listview/list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    // Navigator.pushReplacement;
                    // Navigator.push;
                    // Navigator.pop;
                    // Navigator.popUntil;
                    // Navigator.canPop;

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (_) => const HomeScreenColumn()),
                    // );
                    //  Navigator.pushNamed(context, AppRouteStrings.columnScreen);
                    // Navigator.pushNamed(context, "hello",
                    //     arguments: ManualInputArg(
                    //         pageTitle: "Title", pageContent: "Content"));

                    AppRouter.pushNamed(
                        routeName: AppRouteStrings.columnScreen);
                  },
                  child: const Text("Column Sample")),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreenRow()),
                  );
                },
                child: const Text("Rows Sample"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const HomeScreenListView()),
                  );
                },
                child: const Text("List View Sample"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteStrings.manualInputScreen,
                    arguments: ManualInputArg(
                        pageContent: 'This is the content of our amazing page',
                        pageTitle: "Custom page Amazing"),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => ManualInput(
                  //       arg: ManualInputArg(
                  //           pageContent:
                  //               'This is the content of our amazing page',
                  //           pageTitle: "Custom page Amazing"),
                  //     ),
                  //   ),
                  // );
                },
                child: const Text("Manual Input Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}