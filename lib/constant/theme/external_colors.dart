// External colors to be imported.

import "package:flutter/material.dart";

// create a class for our color
  // this will be a our external colors

class ExternalColors {
  ExternalColors._(); // regard this as a method so that all the colors will be inheritend from the parent class

  // defining our color
  // background color
  static const Color background = Colors.white;

  // text color
  static const Color text = Colors.black;

  // warning/error color
  static const error = Colors.red;

  // success color
  static const success = Colors.green;

  // hint/info color
  static const hint = Colors.blue;

  // primary
  static const Color indicatorColor = Color.fromARGB(101, 37, 100, 235);

  // form card color
  static const Color jobCardColor = Color(0xFF0F1B2D);

   // recent posting
  static const Color recentPositngColor = Color.fromARGB(200, 25, 56, 104);
  
}

