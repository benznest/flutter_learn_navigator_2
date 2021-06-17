import 'color_item.dart';
import 'my_routes.dart';

class MyConfiguration {
  late MyRoutes route;
  late Map<String, dynamic> arguments;

  MyConfiguration(
      {this.route = MyRoutes.HOME, Map<String, dynamic>? arguments}) {
    this.arguments = arguments ?? {};
  }

  MyConfiguration.home() {
    route = MyRoutes.HOME;
    arguments = {};
  }

  MyConfiguration.detail({required ColorItem colorItem}) {
    route = MyRoutes.DETAIL;
    arguments = {"color": colorItem};
  }

  MyConfiguration.unknown() {
    route = MyRoutes.ERROR;
    arguments = {};
  }

  bool get isKnown {
    return route != MyRoutes.ERROR;
  }
}
