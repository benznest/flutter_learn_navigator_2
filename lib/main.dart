import 'package:flutter/material.dart';
import 'my_route_information_parser.dart';
import 'my_router_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: MyRouteInformationParser(),
        routerDelegate: MyRouterDelegate(),
        title: 'Navigator 2.0 Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
