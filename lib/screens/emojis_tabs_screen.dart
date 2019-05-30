import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/emojis.dart';
import 'package:kaomoji_flutter/screens/emojis_screen.dart';

class EmojisTabsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            actions: <Widget>[
              // theme settings
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  Navigator.pushNamed(context, '/themeSelector');
                },
              ),
              // privacy policy
              //   this overflow menu is sort of hacky because we only
              //   use a single child item
              PopupMenuButton(
                onSelected: (selected) {
                  //TODO: open privacy policy
                },
                itemBuilder: (BuildContext context) {
                  return [PopupMenuItem(
                    value: 0,
                    child: Text("Privacy Policy"),
                  )];
                },
              ),
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "HAPPY",
                ),
                Tab(
                  text: "ANGRY",
                ),
                Tab(
                  text: "OTHERS",
                ),
              ],
            ),
            title: Text("ASCII Faces"),
          ),
          body: TabBarView(children: [
            EmojisScreen(
              emojiData: kHappyEmojis,
            ),
            EmojisScreen(
              emojiData: kAngryEmojis,
            ),
            EmojisScreen(
              emojiData: kOtherEmojis,
            ),
          ])),
    );
  }

}