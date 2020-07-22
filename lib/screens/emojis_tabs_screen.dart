import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/emojis.dart' as Emojis;
import 'package:kaomoji_flutter/screens/emojis_screen.dart';

class EmojisTabsScreen extends StatelessWidget {
  final List<TabEntry> _tabEntries = [
    TabEntry(
      tab: Tab(text: "HAPPY"),
      tabView: EmojisScreen(emojiData: Emojis.kEmojisHappy),
    ),
    TabEntry(
      tab: Tab(text: "ANGRY"),
      tabView: EmojisScreen(emojiData: Emojis.kEmojisAngry),
    ),
    TabEntry(
      tab: Tab(text: "OTHERS"),
      tabView: EmojisScreen(emojiData: Emojis.kEmojisOther),
    ),
  ];
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
              onPressed: () => Navigator.pushNamed(context, '/themeSelector'),
            ),
          ],
          bottom: TabBar(
            tabs: _tabEntries.map((entry) => entry.tab).toList(),
          ),
          title: Text("ASCII Emotes"),
        ),
        body: TabBarView(
          children: _tabEntries.map((entry) => entry.tabView).toList(),
        ),
      ),
    );
  }
}

class TabEntry {
  final Tab tab;
  final Widget tabView;
  TabEntry({
    this.tab,
    this.tabView,
  });
}
