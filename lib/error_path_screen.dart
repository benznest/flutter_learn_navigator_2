import 'package:flutter/material.dart';

class ErrorPathScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        color: Colors.red[100],
        child: Center(
          child: Text(
            'Error, No page',
            style: TextStyle(color: Colors.red[400], fontSize: 18),
          ),
        ),
      ),
    );
  }
}
