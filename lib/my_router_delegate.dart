import 'package:flutter/material.dart';

import 'color_detail_screen.dart';
import 'color_list_screen.dart';
import 'error_path_screen.dart';
import 'my_app_state.dart';
import 'my_configuration.dart';
import 'my_page.dart';
import 'my_routes.dart';

class MyRouterDelegate extends RouterDelegate<MyConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyConfiguration> {
  late MyAppState state;

  MyRouterDelegate() {
    print("MyRouterDelegate new instance");
    this.state = MyAppState();
    this.state.addListener(notifyListeners);
  }

  @override
  dispose(){
    super.dispose();
    state.removeListener(notifyListeners);
  }

  @override
  MyConfiguration? get currentConfiguration {
    print("currentConfiguration state_color = ${state.color}");

    if (state.isError) {
      return MyConfiguration.unknown();
    } else {
      if (state.color != null) {
        return MyConfiguration.detail(colorItem: state.color!);
      }
      return MyConfiguration.home();
    }
  }

  // override PopNavigatorRouterDelegateMixin.
  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Navigator(
      onPopPage: (route, result) {
        print("onPopPage");
        return _handlePopPage(route, result);
      },
      pages: [
        MaterialPage(
            key: ValueKey('page_home'),
            child: ColorListScreen(
              onColorItemSelected: (colorItem) {
                // state.location = "/colors/${colorItem.title}";
                state.color = colorItem;
              },
            )),
        if (state.color != null)
          MyPage(
              key: ValueKey('page_color_detail'),
              child: ColorDetailScreen(
                colorItem: state.color!,
              )),
        if (state.isError)
          MaterialPage(key: ValueKey('page_error'), child: ErrorPathScreen()),
      ],
    );
  }

  bool _handlePopPage(Route route, result) {
    Page page = route.settings as Page;
    if (page.key == ValueKey("page_home")) {
      return false;
    }

    route.didPop(result);

    if (page.key == ValueKey("page_color_detail")) {
      state.color = null;
      return true;
    }
    if (page.key == ValueKey("page_error")) {
      state.color = null;
      return true;
    }
    return false;
  }

  @override
  Future<void> setNewRoutePath(MyConfiguration configuration) async {
    print("setNewRoutePath = ${configuration.route}");
    if (configuration.isKnown) {


      if(configuration.route == MyRoutes.HOME){
        state.isError = false;
        state.color = null;
        return;
      }
      else if(configuration.route == MyRoutes.DETAIL) {
        Map<String, dynamic> arguments = configuration.arguments;
        if (arguments.containsKey("color")) {
          var colorItem = arguments["color"];
          if (colorItem != null) {
            state.isError = false;
            state.color = colorItem;
            return;
          }
        }
      }
    }

    state.isError = true;
    state.color = null;
  }
}
