import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:hive/hive.dart';

import 'package:holt_soundboard/strings/sounds.dart';

class SoundsProvider extends ChangeNotifier {
  List<String> getCharacters() => SoundStrings.characters;
  Map getSounds() => SoundStrings.sounds;

  playSound(String character, String sound) async {
    print("Playing $character, $sound");

    String url = "sounds/${character}/${sound}";
    print(url);

    AudioCache audioPlayer = AudioCache();
    audioPlayer.play(url);
  }

  addToFavorites(BuildContext context, String character, String sound) async {
    var favoritesBox = Hive.box('favorites');

    List favorites = favoritesBox.get('allFavorites') ?? [];
    print("Current favorites: $favorites");
    print("Trying to add $character, $sound to favorites");

    String soundString = "$character/$sound";

    // only add to favorites if not already there
    if (! favorites.contains(soundString)) {
      print("sound not in faovirtes");
      favorites.add(soundString);
      print(favorites);

      favoritesBox.put("allFavorites", favorites);
    } else {
      print("NOTHING CHANGED");
    }

    Navigator.of(context).pop();

    notifyListeners();
  }

  removeFromFavorites(BuildContext context, String character, String sound) async {
    var favoritesBox = Hive.box('favorites');
    List favorites = favoritesBox.get('allFavorites') ?? [];

    String soundString = "$character/$sound";

    // first find if it's even in the favorites
    if (favorites.contains(soundString)) {
      favorites.remove(soundString);
      print("removed");
      favoritesBox.put("allFavorites", favorites);
    } else {
      print("never was in favorites");
    }

    Navigator.of(context).pop();

    notifyListeners();
  }

  static getFavorites() {
    var favoritesBox = Hive.box('favorites');
    List favorites = favoritesBox.get('allFavorites') ?? [];
    return favorites;
  }
}