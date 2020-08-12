import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/screens/emojis_tabs_screen.dart';
import 'package:kaomoji_flutter/screens/theme_selector_screen.dart';
import 'package:provider/provider.dart';
import 'models/theme_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ThemeModel themeModel = ThemeModel();
  final ThemeData theme = await themeModel.theme;
  runApp(MyApp(
    themeModel: themeModel,
    theme: theme,
  ));
}

// TODO: figure out splashscreen: /android/app/src/main/res/drawable/launch_background - sdk <= 19 uses different mipmap load method in xml
// TODO: fix wonky character parsing (confirmed on sdk19, maybe more)
class MyApp extends StatelessWidget {
  final ThemeModel themeModel;
  final ThemeData theme;
  MyApp({
    @required this.themeModel,
    @required this.theme,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeModel,
      builder: (BuildContext context, __) => FutureBuilder<ThemeData>(
        future: Provider.of<ThemeModel>(context).theme,
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.done:
              return MaterialApp(
                //debugShowCheckedModeBanner: false,
                title: 'ASCII Emotes',
                theme: snapshot.connectionState == ConnectionState.done
                    ? snapshot.data
                    : theme,
                initialRoute: '/',
                routes: {
                  '/': (context) => EmojisTabsScreen(),
                  '/themeSelector': (context) => ThemeSelectorScreen(),
                },
              );
          }
          return null;
        },
      ),
    );
  }
}
