import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

// Sharing files
import 'dart:typed_data';
import "package:flutter/services.dart" show rootBundle;

import 'package:holt_soundboard/providers/sounds_provider.dart';
import 'package:holt_soundboard/providers/theme_provider.dart';

import 'package:holt_soundboard/styles/colors.dart';
import 'package:holt_soundboard/styles/constants.dart';
import 'package:provider/provider.dart';

class BottomSheets {
  static moreVert(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    // final SoundsProvider soundsProvider= Provider.of<SoundsProvider>(context);

    return bottomSheetTemplate(context, [
      bottomSheetTile(context, Icons.share, "Share", () {
        print("share");
        Share.text('Android App', 'https://play.google.com/store/apps/details?id=com.themindstorm.holt_soundboard', 'text/plain');
      }),
      Divider(),
      bottomSheetTile(context, Icons.brightness_5, "Light theme", () =>
        themeProvider.setTheme('light')
      ),
      bottomSheetTile(context, Icons.brightness_2, "Dark theme", () =>
        themeProvider.setTheme('dark')
      ),
      bottomSheetTile(context, Icons.brightness_1, "Black theme", () =>
        themeProvider.setTheme('black')
      ),
    ]);
  }

  static soundButtonMenu(BuildContext context, String character, String sound) {
    // if it's in the favorites list, show a different tile
    var favoritesBox = Hive.box('favorites');
    List favorites = favoritesBox.get('allFavorites') ?? [];
    String soundString = "$character/$sound";

    var favoritesTile;

    if (favorites.contains(soundString)) {
      favoritesTile = bottomSheetTile(context, Icons.favorite, "Remove from favorites", () {
          final SoundsProvider soundsProvider= Provider.of<SoundsProvider>(context);
          soundsProvider.removeFromFavorites(context, character, sound);
        }
      );
    } else {
      favoritesTile = bottomSheetTile(context, Icons.favorite_border, "Add to favorites", () {
          final SoundsProvider soundsProvider= Provider.of<SoundsProvider>(context);
          soundsProvider.addToFavorites(context, character, sound);
        }
      );
    }

    bottomSheetTemplate(context, [
      favoritesTile, // this tile is different depending on whether the sound has been favorited
      bottomSheetTile(context, Icons.share, "Share", () async {
        final ByteData bytes = await rootBundle.load('assets/sounds/$character/$sound');
        await Share.file('$sound', '$sound', bytes.buffer.asUint8List(), 'audio/mp3');
      }),
    ]);
  }

  static bottomSheetTemplate(BuildContext context, List<Widget> items) => showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => Container(
      decoration: BoxDecoration(
        color: AppColors.drawer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BorderRadii.bottomSheet),
          topRight: Radius.circular(BorderRadii.bottomSheet)
        ),
      ),
      child: SafeArea(
        child: Wrap(
          children: items,
        ),
      ),
    )
  );

  static Widget bottomSheetTile(BuildContext context, IconData icon, String text, Function onTap) => ListTile(
    leading: Icon(icon, color: AppColors.white,),
    title: Text(text, style: Theme.of(context).textTheme.caption,),
    onTap: onTap,
  );
}