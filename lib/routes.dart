import 'package:flutter/material.dart';

import 'package:holt_soundboard/pages/favorites_page.dart';
import 'package:holt_soundboard/pages/about_page.dart';
import 'package:holt_soundboard/pages/suggest_page.dart';

routes(BuildContext context) => <String, WidgetBuilder> {
  "/FavoritesPage": (BuildContext context) => FavoritesPage(),
  "/AboutPage": (BuildContext context) => AboutPage(),
  "/SuggestPage": (BuildContext context) => SuggestPage()
};