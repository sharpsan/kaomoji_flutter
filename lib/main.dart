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
    context.ancestorStateOfType(const TypeMatcher<_MyAppState>());
    state.restartApp();
  }

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = new UniqueKey();
  Future<ThemeData> theme;

  Future<ThemeData> loadTheme(BuildContext context) async {
    //await Future.delayed(Duration(seconds: 3));
    ThemeHelper themeHelper = new ThemeHelper(context: context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeIdInt = (prefs.getInt('theme') ?? ThemeIds.DEFAULT_THEME);
    ThemeData theme = themeHelper.getThemeById(themeIdInt);
    return theme;
  }


  void restartApp() {
    this.setState(() {
      key = new UniqueKey();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeHelper themeHelper = new ThemeHelper(context: context);
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
            title: 'Flutter Demo',
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
