import 'package:flutter/material.dart';
import 'package:secondapp/features/Navigation/router.dart';
import 'package:secondapp/features/navigation/route_strings.dart';

void main() {
  runApp(MyApp());
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.appRouter,
      initialRoute: AppRouteStrings.loginScreen,
    );
  }
}
