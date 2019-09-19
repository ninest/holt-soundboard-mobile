import 'package:flutter/material.dart';
import 'package:holt_soundboard/styles/constants.dart';
import 'package:holt_soundboard/widgets/footer.dart';
import 'package:holt_soundboard/widgets/sounds_grid.dart';
import 'package:provider/provider.dart';

import 'package:holt_soundboard/providers/sounds_provider.dart';
import 'package:holt_soundboard/styles/themes.dart';

import 'package:holt_soundboard/widgets/appbars.dart';
import 'package:holt_soundboard/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(Theme.of(context).scaffoldBackgroundColor);
    // print(AppColors.black);
    // print(Theme.of(context).scaffoldBackgroundColor == AppColors.black);

    final SoundsProvider soundsProvider = Provider.of<SoundsProvider>(context);
    // print(soundsProvider.getCharacters().length);

    return Scaffold(
      drawer: AppDrawer(),
      body: DefaultTabController(
        length: soundsProvider.getCharacters().length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverSafeArea(
                  top: false,
                  bottom: false,
                  sliver: Appbars.primary(context)
                ),
              )
            ];
          },
          body: TabBarView(
            children: <Widget>[
              for (var character in soundsProvider.getCharacters()) 
                SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        key: PageStorageKey<String>(character),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.all(PaddingValues.main),
                            sliver: SoundsGrid(
                              character: character,
                              isFavoritesGrid: false
                            )
                          ),
                          SliverToBoxAdapter(
                            child: Footer(),
                          )
                        ],
                      );
                    }
                  ),
                )
            ],
          )
        ),
      )
    );
  }
}