import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/constants.dart';
import 'package:kaomoji_flutter/constants/theme_ids.dart';
import 'package:kaomoji_flutter/main.dart';
import 'package:kaomoji_flutter/models/theme_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';


const themeEntries = [
  const ThemeEntry(id: ThemeIds.DEFAULT, name: 'Default', description: 'Blue light theme'),
  //const ThemeEntry(id: ThemeIds.LIGHT, name: 'Light', description: 'White light theme'),
  const ThemeEntry(id: ThemeIds.DARK, name: 'Dark', description: 'Material grey hybrid theme'),
  const ThemeEntry(id: ThemeIds.DARKER, name: 'Darker', description: 'Material grey dark theme'),
  const ThemeEntry(id: ThemeIds.BLACK, name: 'Black', description: 'Black hybrid theme'),
  const ThemeEntry(id: ThemeIds.BLACK, name: "AMOLED Black", description: "Black dark theme"),
  const ThemeEntry(id: ThemeIds.RED_GREY, name: "Red/Grey", description: "Light theme"),
];

class ThemeSelectorScreen extends StatefulWidget {
  @override
  _ThemeSelectorScreenState createState() => _ThemeSelectorScreenState();
}

class _ThemeSelectorScreenState extends State<ThemeSelectorScreen> {
  void applyTheme(BuildContext context, int themeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', themeId).whenComplete(() {
      MyApp.restartApp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: <Widget>[
          // header
          Container(
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // themes
          Expanded(
            child: ListView.builder(
              itemCount: themeEntries.length,
              padding: EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 20.0,
              ),
              itemBuilder: (context, index) {
                ThemeEntry themeEntry = themeEntries[index];
                return Container(
                  height: 70.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            themeEntry.name,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey.shade600),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            themeEntry.description,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                      RaisedButton(
                        onPressed: () => applyTheme(context, index),
                        child: Text('SET'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
