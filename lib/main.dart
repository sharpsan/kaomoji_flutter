import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/theme_ids.dart';
import 'package:kaomoji_flutter/screens/emojis_tabs_screen.dart';
import 'package:kaomoji_flutter/screens/theme_selector_screen.dart';
import 'package:kaomoji_flutter/utilities/theme_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final Widget child;
  MyApp({this.child});

  static restartApp(BuildContext context) {
    final _MyAppState state =
    context.findAncestorStateOfType<_MyAppState>();
    state.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

// TODO: figure out splashscreen: /android/app/src/main/res/drawable/launch_background - sdk <= 19 uses different mipmap load method in xml
// TODO: fix wonky character parsing (confirmed on sdk19, maybe more)
class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  Future<ThemeData> theme;

  Future<ThemeData> loadTheme(BuildContext context) async {
    //await Future.delayed(Duration(seconds: 3));
    ThemeHelper themeHelper = ThemeHelper(context: context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeIdInt = (prefs.getInt('theme') ?? ThemeIds.DEFAULT);
    ThemeData theme = themeHelper.getThemeById(themeIdInt);
    return theme;
  }


  void restartApp() {
    this.setState(() {
      key = UniqueKey();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeHelper themeHelper = ThemeHelper(context: context);
    theme = loadTheme(context);

    return FutureBuilder<ThemeData>(
      future: theme,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
          case ConnectionState.done:
          return MaterialApp(
            //debugShowCheckedModeBanner: false,
            title: 'ASCII Emotes',
            theme: snapshot.data,
            initialRoute: '/',
            routes: {
              '/' : (context) => EmojisTabsScreen(),
              '/themeSelector' : (context) => ThemeSelectorScreen(),
            },
          );
        }
      },
    );
  }
}
