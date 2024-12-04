import 'package:flutter/cupertino.dart';
import 'package:secondapp/features/Navigation/route_strings.dart';
import 'package:secondapp/features/home/home_screen.dart';
import 'package:secondapp/features/login/login_screen.dart';
import 'package:secondapp/features/manual_input/manual_input.dart';
import 'package:secondapp/features/user_input/user_input_screen.dart';

import '../columns/column.dart';

class AppRouter {
  static final navKey = GlobalKey<NavigatorState>();

  static Route appRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteStrings.base:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case AppRouteStrings.columnScreen:
        return CupertinoPageRoute(builder: (_) => const HomeScreenColumn());
      case AppRouteStrings.manualInputScreen:
        return CupertinoPageRoute(
          builder: (_) =>
              ManualInput(arg: settings.arguments as ManualInputArg),
        );
      case AppRouteStrings.userInputScreen:
        return CupertinoPageRoute(builder: (_) => const UserInputScreen());
      case AppRouteStrings.loginScreen:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());

      default:
        return CupertinoPageRoute(builder: (_) => const SizedBox());
    }
  }

  static void pushNamed({required String routeName, Object? arg}) {
    navKey.currentState?.pushNamed(routeName, arguments: arg);
  }
}
