import 'package:flutter/material.dart';

class MyRouteInformationProvider extends RouteInformationProvider {

  @override
  void addListener(listener) {
    //
  }

  @override
  void removeListener(listener) {
    //
  }

  @override
  RouteInformation? get value {
    print("MyRouteInformationProvider : get value ");

  }

  @override
  routerReportsNewRouteInformation(RouteInformation routeInformation) {
    print(
        "MyRouteInformationProvider : routerReportsNewRouteInformation ${routeInformation.location}");
  }
}
