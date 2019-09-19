import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:holt_soundboard/providers/url_launcher.dart';

import 'package:holt_soundboard/strings/page_content.dart';
import 'package:holt_soundboard/strings/titles.dart';
import 'package:holt_soundboard/styles/colors.dart';

import 'package:holt_soundboard/styles/constants.dart';

import 'package:holt_soundboard/widgets/appbars.dart';


class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Appbars.secondary(context, Titles.aboutPageTitle),
          SliverPadding(
            padding: EdgeInsets.all(PaddingValues.main),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SafeArea(
                  top: false,
                  bottom: false,
                  child: MarkdownBody(data: PageContent.aboutPageContent,),
                ),
                Divider(height: 50,),
                // Spacer(flex: 1,),
                RaisedButton(child: Text("Reddit"), color: AppColors.red, onPressed: () {
                  Url.launchUrl("https://www.reddit.com/r/holt_soundboard");
                },),
                RaisedButton(child: Text("Suggest sound or feature"), color: AppColors.black, onPressed: () {
                  Url.launchUrl("https://holt-soundboard.github.io/suggest/");
                },)
              ]),
            )
          )
        ],
      )
    );
  }
}