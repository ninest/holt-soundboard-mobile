import 'package:flutter/material.dart';
import 'package:holt_soundboard/providers/url_launcher.dart';
import 'package:holt_soundboard/styles/colors.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holt_soundboard/styles/constants.dart';


class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkGray,
      padding: EdgeInsets.all(PaddingValues.soundButton),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          linkButton(FontAwesomeIcons.reddit, "https://reddit.com/r/holt_soundboard"),
          linkButton(FontAwesomeIcons.github, "https://github.com/holt-soundboard/holt-soundboard-mobile"),
        ],
      ),
    );
  }

  linkButton(IconData icon, String url) => IconButton(
    icon: Icon(icon, size: 30,),
    onPressed: () { Url.launchUrl(url); },
  );
}