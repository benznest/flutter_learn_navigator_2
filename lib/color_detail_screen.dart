import 'package:flutter/material.dart';

import 'color_item.dart';

class ColorDetailScreen extends StatefulWidget {
  final ColorItem colorItem;

  ColorDetailScreen({required this.colorItem});

  @override
  _ColorDetailScreenState createState() => _ColorDetailScreenState();
}

class _ColorDetailScreenState extends State<ColorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: widget.colorItem.color,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${widget.colorItem.title}',
                  style: TextStyle(color: Colors.grey[800], fontSize: 28),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.grey[800], fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
