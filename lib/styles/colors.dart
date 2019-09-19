import 'package:flutter/material.dart';

class AppColors {
  // Scaffold background colors
  static Color white = Colors.white;
  static Color darkGray = Color(0xFF0f0f0f);
  static Color black = Colors.black;

  // drawer color
  static Color drawer = Color(0xaa000000);

  // text colors
  static Color gray = Color(0xFFcbcbcd);


  // sound button colors
  static Color main = Color(0xFF0f1e3d);
  static Color blue = Color(0xFF4285f3);
  static Color green = Color(0xFF55a854);
  static Color yellow = Color(0xFFf5aa22);
  static Color red = Color(0xFFe94234);
  static Color dark(BuildContext context) => Theme.of(context).scaffoldBackgroundColor == darkGray ? Colors.white : Colors.black;

  static Color getColor(BuildContext context, String name) {
    Color color;
    String firstLetter = name[0].toLowerCase();

    switch (firstLetter) {
      case 'a':
      case 'b':
      case 'c':
      case 'd':
      case 'e':
        {
          color = blue;
          break;
        }

      case 'f':
      case 'g':
      case 'h':
      case 'i':
      case 'j':
        {
          color = green;
          break;
        }

      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
        {
          color = yellow;
          break;
        }

      case 'p':
      case 'q':
      case 'r':
      case 's':
      case 't':
        {
          color = red;
          break;
        }

      case 'u':
      case 'v':
      case 'w':
      case 'x':
      case 'y':
      case 'z':
        {
          color = dark(context);
          break;
        }
    }
    return color;
  }
}