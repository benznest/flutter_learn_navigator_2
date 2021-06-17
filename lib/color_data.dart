import 'package:flutter/material.dart';
import 'color_item.dart';

class ColorData{
 static List<ColorItem> colors = [
    ColorItem(color: Colors.red[300]!, title: "Red"),
    ColorItem(color: Colors.green[300]!, title: "Green"),
    ColorItem(color: Colors.blue[300]!, title: "Blue"),
    ColorItem(color: Colors.orange[300]!, title: "Orange"),
    ColorItem(color: Colors.purple[300]!, title: "Purple"),
  ];

 static ColorItem? getByTitle(String title){
   List<ColorItem> list = colors.where((e) => e.title == title).toList();
   if(list.isNotEmpty){
     return list.first;
   }
   return null;
 }
}