import 'package:flutter/material.dart';
import 'package:holt_soundboard/styles/colors.dart';
import 'package:holt_soundboard/widgets/custom_tab_indicator.dart';
import 'package:provider/provider.dart';

import 'package:holt_soundboard/strings/titles.dart';
import 'package:holt_soundboard/providers/sounds_provider.dart';

import 'package:holt_soundboard/widgets/bottom_sheets.dart';

class Appbars {
  static primary(BuildContext context) {
    final SoundsProvider soundsProvider = Provider.of<SoundsProvider>(context);
    // List<Widget> characterTabList = 

    return SliverAppBar(
      title: Text(Titles.appTitle),
      actions: <Widget>[
        AppBarButtons.favoritesPageButton(context),
        AppBarButtons.moreVertMenu(context)
      ],
      backgroundColor: Theme.of(context).accentColor,
      floating: true,
      pinned: true,
      // snap: true,
      primary: true,
      elevation: 20.0,
      bottom: TabBar(
        tabs: <Widget>[
          for (var character in soundsProvider.getCharacters())
            Tab(
              // text: character,
              child: Container(
                child: Text(character, style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Rubik'
                ),),
                padding: EdgeInsets.only(left: 5, right: 5),
              ),
            )
        ],
        isScrollable: true,
        labelColor: AppColors.black,
        labelStyle: TextStyle(fontSize: 18),
        unselectedLabelColor: Theme.of(context).indicatorColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: CustomTabIndicator(context: context),
      ),
    );
  }

  static favorites(BuildContext context) {
    return SliverAppBar(
      title: Text(Titles.favoritesPageTitle),
      backgroundColor: Theme.of(context).accentColor,
      floating: true,
      pinned: false,
      elevation: 20.0,
    );
  }

  static secondary(BuildContext context, String title) {
    return SliverAppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).accentColor,
      floating: true,
      pinned: false,
      elevation: 20.0,
    );
  }
}

class AppBarButtons {
  static IconButton moreVertMenu(BuildContext context) => IconButton(
    icon: Icon(Icons.more_vert),
    onPressed: () => BottomSheets.moreVert(context),
  );

  static IconButton favoritesPageButton(BuildContext context) => IconButton(
    icon: Icon(Icons.favorite_border),
    onPressed: () => Navigator.of(context).pushNamed("/FavoritesPage"),
  );
}