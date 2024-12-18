import 'package:flutter/material.dart';
import 'package:secondapp/features/Navigation/router.dart';
import 'package:secondapp/features/navigation/route_strings.dart';

import 'features/local_storage/local_storage_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorageClass().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.navKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        applyElevationOverlayColor: true,
        appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            elevation: 1,
            titleTextStyle: TextStyle(
              fontSize: 25,
              color: Colors.pink,
              fontWeight: FontWeight.w700,
            )),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
      ),
      onGenerateRoute: AppRouter.appRouter,
      initialRoute: AppRouteStrings.base,
    );
  }
}
