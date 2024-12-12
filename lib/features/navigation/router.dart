import 'package:flutter/cupertino.dart';
import 'package:secondapp/features/Navigation/route_strings.dart';
import 'package:secondapp/features/back_values/pop_value_screen.dart';
import 'package:secondapp/features/carousel/carousel_screen.dart';
import 'package:secondapp/features/home/home_screen.dart';
import 'package:secondapp/features/login/login_screen.dart';
import 'package:secondapp/features/manual_input/manual_input.dart';
import 'package:secondapp/features/user_input/user_input_screen.dart';

import '../columns/column.dart';
import '../page_view/page_view_screen.dart';
import '../tabbar_view/tabbar_view_screen.dart';

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
      case AppRouteStrings.carouselScreen:
        return CupertinoPageRoute(builder: (_) => const CarouselScreen());
      case AppRouteStrings.pageViewScreen:
        return CupertinoPageRoute(builder: (_) => const PageViewScreen());
      case AppRouteStrings.tabBarViewScreen:
        return CupertinoPageRoute(builder: (_) => const TabBarViewScreen());
      case AppRouteStrings.popValueScreen:
        return CupertinoPageRoute(builder: (_) => const PopValueScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const SizedBox());
    }
  }

  static void pushNamed({required String routeName, Object? arg}) {
    navKey.currentState?.pushNamed(routeName, arguments: arg);
  }
}
