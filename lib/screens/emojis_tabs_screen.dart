import 'package:flutter/material.dart';
import 'package:kaomoji_flutter/constants/emojis.dart' as Emojis;
import 'package:kaomoji_flutter/screens/emojis_screen.dart';

class EmojisTabsScreen extends StatefulWidget {
  const EmojisTabsScreen({Key? key}) : super(key: key);

  @override
  State<EmojisTabsScreen> createState() => _EmojisTabsScreenState();
}

class _EmojisTabsScreenState extends State<EmojisTabsScreen>
    with SingleTickerProviderStateMixin {
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
    TabEntry(
      tab: Tab(text: "CUSTOM"),
      tabView: EmojisScreen(emojiData: []),
    ),
  ];

  bool showAddCustomEmojiFab = false;
  late final TabController _tabController = TabController(
    length: 4,
    vsync: this,
  )..addListener(() {
      /// Show the FAB only on the custom tab
      _setFabVisibility(_tabController.index == 3);
    });

  void _setFabVisibility(bool show) {
    if (show != showAddCustomEmojiFab)
      setState(() {
        showAddCustomEmojiFab = show;
      });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            // theme settings
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () => Navigator.pushNamed(context, '/themeSelector'),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabEntries.map((entry) => entry.tab).toList(),
          ),
          title: Text("ASCII Emotes"),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabEntries.map((entry) => entry.tabView).toList(),
        ),
        floatingActionButton: showAddCustomEmojiFab
            ? FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              )
            : null);
  }
}

class TabEntry {
  final Tab tab;
  final Widget tabView;
  TabEntry({
    required this.tab,
    required this.tabView,
  });
}
