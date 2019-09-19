import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:holt_soundboard/providers/sounds_provider.dart';

import 'package:holt_soundboard/styles/colors.dart';
import 'package:holt_soundboard/styles/constants.dart';

import 'package:holt_soundboard/widgets/bottom_sheets.dart';

class SoundButton extends StatelessWidget {
  SoundButton({this.character, this.sound});
  final character;
  final sound;

  @override
  Widget build(BuildContext context) {

    final SoundsProvider soundsProvider = Provider.of<SoundsProvider>(context);

    // if dark mode, change opacity
    double opacity = Theme.of(context).scaffoldBackgroundColor == AppColors.darkGray ? 0.7 : 1.0;

    // if it's black mode, make all sound buttons super dark
    bool isBlackMode = Theme.of(context).scaffoldBackgroundColor == AppColors.black;

    return GestureDetector(
      child: Opacity(
        opacity: opacity,
        child: Container(
          child: Center(
            child: Text(
              sound.split(".mp3")[0],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          padding: EdgeInsets.all(PaddingValues.soundButton),
          decoration: BoxDecoration(
            color: isBlackMode ? AppColors.darkGray :  AppColors.getColor(context, sound),
            borderRadius: BorderRadius.all(Radius.circular(BorderRadii.soundButton)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.22),
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ]
          ),
        ),
      ),
      onTap: () => soundsProvider.playSound(character, sound),
      onLongPress: () => BottomSheets.soundButtonMenu(context, character, sound),
    );
  }
} 