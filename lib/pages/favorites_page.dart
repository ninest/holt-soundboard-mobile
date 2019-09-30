import 'package:flutter/material.dart';
import 'package:holt_soundboard/providers/sounds_provider.dart';

import 'package:holt_soundboard/widgets/appbars.dart';
import 'package:holt_soundboard/widgets/sounds_grid.dart';

import 'package:holt_soundboard/styles/constants.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final SoundsProvider soundsProvider = Provider.of<SoundsProvider>(context);

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