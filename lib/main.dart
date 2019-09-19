import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:holt_soundboard/routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

import 'package:holt_soundboard/styles/themes.dart';
import 'package:holt_soundboard/providers/theme_provider.dart';
import 'package:holt_soundboard/providers/sounds_provider.dart';

import 'package:holt_soundboard/pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

Future _openBoxes() async {
  var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    return Future.wait([
      Hive.openBox('settings'),
      Hive.openBox('favorites'),
    ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ThemeProvider>.value(value: ThemeProvider()),
      ChangeNotifierProvider<SoundsProvider>.value(value: SoundsProvider())
    ],
      child: Application()
    );
  }
}

// Bounce scroll physics
class BounceScrollBehavior extends ScrollBehavior {
  @override
  getScrollPhysics(_) => const BouncingScrollPhysics();
}

class Application extends StatelessWidget {
  Future _openBoxes() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    return Future.wait([
      Hive.openBox('settings'),
      Hive.openBox('favorites'),
    ]);
  }

  Future _getTheme(BuildContext context) async {
    var settingsBox = Hive.box('settings');

    var theme = settingsBox.get('theme') ?? 'light';
    print("Theme from box: $theme");
    var materialTheme;

    switch (theme) {
      case 'light': {
        materialTheme = ThemesStyles.light(context);
        break;
      }
      case 'dark': {
        materialTheme = ThemesStyles.dark(context);
        break;
      }
      case 'black': {
        materialTheme = ThemesStyles.black(context);
        break;
      }
      default: materialTheme = ThemesStyles.light(context);
    }

    return materialTheme;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   // theme: snapshot.hasData ? snapshot.data : ThemesStyles.black(context),
    //   routes: routes(context),
    //   home: ScrollConfiguration(
    //     behavior: BounceScrollBehavior(),
    //     child: HomePage(),
    //   )
    // );

    return FutureBuilder(
      future: _openBoxes(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FutureBuilder(
          future: _getTheme(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: snapshot.hasData ? snapshot.data : ThemesStyles.black(context),
              routes: routes(context),
              home: ScrollConfiguration(
                behavior: BounceScrollBehavior(),
                child: HomePage(),
              )
            );
          }
        );
      }
    );
  }
}