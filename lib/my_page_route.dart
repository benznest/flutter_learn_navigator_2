import 'package:flutter/widgets.dart';

import 'my_page.dart';

class MyPageRoute extends PageRoute {
  MyPage page;

  MyPageRoute({required this.page}) : super(settings: page);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return page.child;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(seconds: 0);
}
