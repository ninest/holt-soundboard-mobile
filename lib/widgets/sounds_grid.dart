import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:holt_soundboard/providers/sounds_provider.dart';

import 'package:holt_soundboard/styles/constants.dart';
import 'package:holt_soundboard/widgets/sound_button.dart';

class SoundsGrid extends StatelessWidget {
  SoundsGrid({this.character, this.isFavoritesGrid, this.favorites});
  final String character;
  final bool isFavoritesGrid;
  final List favorites;

  @override
  Widget build(BuildContext context) {

    List sounds;
    if (!isFavoritesGrid) {
      final SoundsProvider soundsProvider = Provider.of<SoundsProvider>(context);
      sounds = soundsProvider.getSounds()[character];
    } else {
      sounds = favorites;
    }

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: PaddingValues.main,
        crossAxisSpacing: PaddingValues.main,
        childAspectRatio: 2.2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {

          // for the regular character grid, the character name is provided through the
          // loop in the home_page
          // characterName will be overridden in this is a favoritesGrid
          String characterName = character;
          String soundName = sounds[index];

          if (isFavoritesGrid) {
            // this might get a little confusing
            // sine it's the favorites, the character name is before the sound name
            // the array is like this: ["charactername/soundname", "charactername/soundname", ...]
            characterName = soundName.split("/")[0];

            // need to remove character name from front of string
            soundName = soundName.split("/")[1];
          }
          return SoundButton(
            character: characterName,
            sound: soundName,
          );
        },
        childCount: sounds.length,
      ),
    );
  }
}
