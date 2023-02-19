import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/themes.dart';
import 'package:kaomoji_flutter/models/theme_entry.dart';
import 'package:kaomoji_flutter/models/theme_model.dart';
import 'package:provider/provider.dart';

class ThemeSelectorScreen extends StatefulWidget {
  @override
  _ThemeSelectorScreenState createState() => _ThemeSelectorScreenState();
}

class _ThemeSelectorScreenState extends State<ThemeSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeModel themeModel = Provider.of<ThemeModel>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          /// Header
          _Header(),

          /// Theme cards
          Expanded(
            child: FutureBuilder<ThemeEntry>(
                future: themeModel.theme,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: appThemes.length,
                    padding: EdgeInsets.symmetric(
                      vertical: 25.0,
                      horizontal: 20.0,
                    ),
                    itemBuilder: (context, index) {
                      ThemeEntry themeEntry = appThemes[index];
                      return _ThemeCard(
                        name: themeEntry.name,
                        onButtonPressed: () =>
                            themeModel.applyTheme(themeEntry.key),
                        themePrimaryColor: themeEntry.themeData.primaryColor,
                        isActive:
                            themeEntry.key.index == snapshot.data?.key.index,
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.0,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: AppBar(),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Center(
                child: Text(
                  "Theme Selector",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final String name;
  final VoidCallback? onButtonPressed;
  final bool isActive;
  final Color themePrimaryColor;
  final _dropletSize = 16.0;
  _ThemeCard({
    required this.name,
    this.onButtonPressed,
    this.isActive = false,
    required this.themePrimaryColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          /// preview droplet
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: themePrimaryColor,
            ),
            width: _dropletSize,
            height: _dropletSize,
          ),

          SizedBox(width: 8),

          /// theme title
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          /// apply button
          ElevatedButton(
            onPressed: isActive ? null : onButtonPressed,
            child: Text('SET'),
          ),
        ],
      ),
    );
  }
}
