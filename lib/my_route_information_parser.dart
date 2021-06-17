import 'package:flutter/material.dart';
import 'color_data.dart';
import 'color_item.dart';
import 'my_configuration.dart';
import 'my_routes.dart';

class MyRouteInformationParser extends RouteInformationParser<MyConfiguration> {
  @override
  Future<MyConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    print("MyRouteInformationParser : parseRouteInformation ");
    print("routeInformation = ${routeInformation.location} ");

    var uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return MyConfiguration.home();
    } else if (uri.pathSegments.length == 2 &&
        uri.pathSegments[0] == "colors") {
      ColorItem? colorItem = ColorData.getByTitle(uri.pathSegments[1]);
      if (colorItem != null) {
        return MyConfiguration(
            route: MyRoutes.DETAIL, arguments: {"color": colorItem});
      }
    }

    return MyConfiguration.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(MyConfiguration configuration) {
    print("restoreRouteInformation ${configuration.route}");

    if (configuration.isKnown) {
      if (configuration.route == MyRoutes.HOME) {
        return RouteInformation(location: "/");
      }
      if (configuration.route == MyRoutes.DETAIL) {
        if (configuration.arguments.containsKey("color")) {
          ColorItem? colorItem = configuration.arguments["color"];
          if (colorItem != null) {
            return RouteInformation(
                location: "/colors/${colorItem.title}");
          }
        }
      }
    }
    return RouteInformation(location: "/error");
  }
}
