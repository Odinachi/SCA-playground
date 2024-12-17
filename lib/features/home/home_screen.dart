import 'package:flutter/material.dart';
import 'package:secondapp/features/Navigation/route_strings.dart';
import 'package:secondapp/features/manual_input/manual_input.dart';
import 'package:secondapp/features/rows/rows.dart';

import '../list_view/list_view.dart';

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

                    Navigator.pushNamed(
                      context,
                      AppRouteStrings.manualInputScreen,
                      arguments: ManualInputArg(
                        pageTitle: "new title",
                        pageContent: "Content",
                      ),
                    );

                    // AppRouter.pushNamed(
                    //     routeName: AppRouteStrings.columnScreen);
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
                    AppRouteStrings.userInputScreen,
                  );
                },
                child: const Text("User input"),
              ),
              TextButton(
                onPressed: () {
                  //LINK TO FIGMA: https://www.figma.com/design/ULwXU44cknhSKjTkegHOjY/Login-Mobile-UI-(Community)?node-id=102-19&t=Vm5qjrw1jXRY3naQ-1
                  Navigator.pushNamed(
                    context,
                    AppRouteStrings.loginScreen,
                  );
                },
                child: const Text("Login screen"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteStrings.carouselScreen,
                  );
                },
                child: const Text("Carousel screen"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteStrings.pageViewScreen,
                  );
                },
                child: const Text("Page View screen"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteStrings.tabBarViewScreen,
                  );
                },
                child: const Text("Tab Bar View screen"),
              ),
              TextButton(
                onPressed: () async {
                  final getValue = await Navigator.pushNamed(
                    context,
                    AppRouteStrings.popValueScreen,
                  );
                },
                child: const Text("Getting value back"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteStrings.expansionTileScreen,
                  );
                },
                child: const Text("Expansion Tile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
