import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/models/theme_entry.dart';
import 'package:provider/provider.dart';
import '../models/theme_model.dart';

class ThemeSelectorScreen extends StatefulWidget {
  @override
  _ThemeSelectorScreenState createState() => _ThemeSelectorScreenState();
}

class _ThemeSelectorScreenState extends State<ThemeSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeModel themeModel = Provider.of<ThemeModel>(context);
    List<ThemeEntry> themeEntries = themeModel.themes.values.toList();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: <Widget>[
          /// Header
          _Header(),

          /// Theme cards
          Expanded(
            child: ListView.builder(
              itemCount: themeEntries.length,
              padding: EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 20.0,
              ),
              itemBuilder: (context, index) {
                ThemeEntry themeEntry = themeEntries[index];
                return ThemeCard(
                  name: themeEntry.name,
                  description: themeEntry.description,
                  onButtonPressed: () => themeModel.applyTheme(themeEntry.id),
                );
              },
            ),
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
                    color: Colors.white,
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

class ThemeCard extends StatelessWidget {
  final String name, description;
  final Function onButtonPressed;
  ThemeCard({
    @required this.name,
    @required this.description,
    @required this.onButtonPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
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
                name,
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
                description,
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          RaisedButton(
            onPressed: onButtonPressed,
            child: Text('SET'),
          ),
        ],
      ),
    );
  }
}
