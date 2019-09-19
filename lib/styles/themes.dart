import 'package:flutter/material.dart';
import 'package:holt_soundboard/styles/colors.dart';
import 'package:holt_soundboard/styles/constants.dart';

class ThemesStyles {

  static ThemeData theme(BuildContext context) => Theme.of(context);

  static ThemeData basic(BuildContext context) => ThemeData.light().copyWith(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    
    // dark blue-purple color
    accentColor: Color(0xFF0f1e3d),

    // change default font
    // fontFamily: 'Rubik',

    // default appbar text styles
    appBarTheme: AppBarTheme(
      textTheme: theme(context).textTheme.copyWith(
        title: theme(context).textTheme.title.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w900,
          fontSize: 22,
          letterSpacing: 2
        )
      )
    ),

    textTheme: TextTheme(
      // sound button style
      body1: TextStyle(
        color: Colors.black,
        fontSize: 20
      ),
      button: TextStyle(
        color: AppColors.white,
        fontFamily: 'Rubik',
        fontSize: 16.5,
        fontWeight: FontWeight.w500,
        letterSpacing: 2
      ),
      
      // drawer and bottom sheet text
      caption: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        letterSpacing: 1,
        fontWeight: FontWeight.w700
      )
    ),

    // to make drawer and bottom sheets transparent
    canvasColor: Colors.transparent,

    // selected tab color
    // focusColor: rounded rectangle box color
    // undicatorColor: unselectedLabelColor
    focusColor: AppColors.gray,
    indicatorColor: AppColors.gray,
    highlightColor: AppColors.white,

    // buttons in about page
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BorderRadii.regularButton)), 
      textTheme: ButtonTextTheme.primary
    ),

    iconTheme: IconThemeData(
      color: Colors.white
    )
  );

  static ThemeData light(BuildContext context) => basic(context).copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white
  );

  static ThemeData dark(BuildContext context) => basic(context).copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkGray,

    // changing app bar color
    accentColor: AppColors.darkGray,

    appBarTheme: AppBarTheme(
      textTheme: basic(context).appBarTheme.textTheme.copyWith(
      // textTheme: TextTheme(
        title: basic(context).appBarTheme.textTheme.title.copyWith(
          color: AppColors.gray,
        )
      )
    ),

    textTheme: basic(context).textTheme.copyWith(
      // sound button style
      body1: basic(context).textTheme.body1.copyWith(
        color: AppColors.gray
      ),
      button: basic(context).textTheme.button.copyWith(
        color: AppColors.black,
      ),
    ),

    // selected tab color
    focusColor: AppColors.gray,
    indicatorColor: AppColors.gray,
    highlightColor: AppColors.gray
  );

  static ThemeData black(BuildContext context) => basic(context).copyWith(
    brightness: Brightness.dark,
    // making accent color even darker
    accentColor: AppColors.darkGray,
    scaffoldBackgroundColor: AppColors.black,

    // overriding text color to make it darker
    appBarTheme: AppBarTheme(
      textTheme: basic(context).appBarTheme.textTheme.copyWith(
      // textTheme: TextTheme(
        title: basic(context).appBarTheme.textTheme.title.copyWith(
          color: AppColors.gray,
        )
      )
    ),

    textTheme: basic(context).textTheme.copyWith(
      body1: basic(context).textTheme.body1.copyWith(
        color: AppColors.gray
      ),
      button: basic(context).textTheme.button.copyWith(
        color: AppColors.gray
      )
    ),
    // textTheme: basic(context).textTheme.copyWith(
    //   // sound button style
    //   body1: basic(context).textTheme.body1.copyWith(
    //     color: AppColors.gray
    //   )
    // )

    // selected tab color
    focusColor: AppColors.gray,
  );
}
