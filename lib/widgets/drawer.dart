import 'package:flutter/material.dart';
import 'package:holt_soundboard/providers/url_launcher.dart';

import 'package:holt_soundboard/styles/constants.dart';
import 'package:holt_soundboard/styles/colors.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: AppColors.drawer,
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(PaddingValues.main),
              children: <Widget>[
                drawerTile(context, Icons.info, "ABOUT", () => openRoute(context, "/AboutPage")),
                drawerTile(context, Icons.comment, "SUGGEST", () => openRoute(context, "/SuggestPage")),
                drawerTile(context, Icons.open_in_browser, "GITHUB", () {
                  Url.launchUrl("https://github.com/holt-soundboard/holt-soundboard-mobile");
                }),
                drawerTile(context, Icons.open_in_browser, "REDDIT", () {
                  Url.launchUrl("https://reddit.com/r/holt_soundboard");
                }),
              ],
            ),
          )
        )
    );
  }

  Widget drawerTile(BuildContext context, IconData icon, String text, Function onTap) => ListTile(
    leading: Icon(icon, color: AppColors.white,),
    title: Text(text, style: Theme.of(context).textTheme.caption,),
    onTap: onTap
  );

  openRoute(BuildContext context, String route) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(route);
  }
}