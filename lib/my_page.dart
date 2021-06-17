import 'package:flutter/widgets.dart';

class MyPage extends Page {
  final Widget child;

  MyPage({LocalKey? key, required this.child}) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    // return MyPageRoute(page: this);
    return PageRouteBuilder(
      settings: this,
      transitionDuration: Duration(seconds: 1),
      reverseTransitionDuration: Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
