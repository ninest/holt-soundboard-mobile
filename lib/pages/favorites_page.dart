import 'package:flutter/material.dart';
import 'package:holt_soundboard/providers/sounds_provider.dart';

import 'package:holt_soundboard/widgets/appbars.dart';
import 'package:holt_soundboard/widgets/sounds_grid.dart';

import 'package:holt_soundboard/styles/constants.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List favorites = SoundsProvider.getFavorites();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Appbars.favorites(context),
          SliverPadding(
            padding: EdgeInsets.all(PaddingValues.main),
            sliver: SoundsGrid(
              isFavoritesGrid: true,
              favorites: favorites,
            ),
          )
        ],
      )
    );
  }
}