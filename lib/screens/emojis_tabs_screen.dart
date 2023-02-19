import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaomoji_flutter/constants/emojis.dart' as Emojis;
import 'package:kaomoji_flutter/models/custom_emojis_model.dart';
import 'package:kaomoji_flutter/screens/emojis_screen.dart';
import 'package:provider/provider.dart';

class EmojisTabsScreen extends StatefulWidget {
  const EmojisTabsScreen({Key? key}) : super(key: key);

  @override
  State<EmojisTabsScreen> createState() => _EmojisTabsScreenState();
}

class _EmojisTabsScreenState extends State<EmojisTabsScreen>
    with SingleTickerProviderStateMixin {
  bool showAddCustomEmojiFab = false;
  late final CustomEmojisModel _customEmojisModel;
  late final TabController _tabController = TabController(
    length: 4,
    vsync: this,
  )..addListener(
      () {
        /// Show the FAB only on the custom tab
        _setFabVisibility(_tabController.index == 3);
      },
    );
  final _textEditingController = TextEditingController();

  void _setFabVisibility(bool show) {
    if (show != showAddCustomEmojiFab)
      setState(() {
        showAddCustomEmojiFab = show;
      });
  }

  @override
  void initState() {
    _customEmojisModel = Provider.of<CustomEmojisModel>(
      context,
      listen: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tabEntries = [
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
        tabView: EmojisScreen(
            emojiData: _customEmojisModel.customEmojis,
            onEmojiLongPress: (emoji) {
              /// show a dialog to remove a custom emoji
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Remove a custom emoji"),
                  content: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      text: "Are you sure you want to remove ",
                      children: [
                        TextSpan(
                          text: emoji,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "?"),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        _customEmojisModel.removeCustomEmoji(emoji);
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text("Remove"),
                    ),
                  ],
                ),
              );
            }),
      ),
    ];

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
                onPressed: () {
                  /// show a dialog to add a custom emoji
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Add a custom emoji"),
                      content: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                hintText: "Enter a custom emoji",
                              ),
                            ),
                          ),

                          /// paste button
                          IconButton(
                            icon: Icon(Icons.content_paste),
                            onPressed: () {
                              /// get the text from the clipboard
                              Clipboard.getData(Clipboard.kTextPlain).then(
                                (value) {
                                  if (value != null) {
                                    _textEditingController.text =
                                        value.text ?? "";
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            final emoji = _textEditingController.text;
                            if (emoji.isEmpty) return;
                            _customEmojisModel.addCustomEmoji(emoji);
                            Navigator.pop(context);
                            setState(() {});
                            _textEditingController.clear();
                          },
                          child: Text("Add"),
                        ),
                      ],
                    ),
                  );
                },
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
