import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmojisScreen extends StatelessWidget {
  final FutureOr<List<String>> emojiData;
  final Function(String emoji)? onEmojiLongPress;
  EmojisScreen({
    required this.emojiData,
    this.onEmojiLongPress,
  });

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text)).whenComplete(() {
      final snackBar = SnackBar(
        content: Text('Face copied to clipboard'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: Future.value(emojiData),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          /// show icon is there are no entries
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Icon(
                Icons.sentiment_neutral,
                size: 100.0,
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
            itemBuilder: (context, index) {
              return EmojiCard(
                emoji: snapshot.data![index],
                onPressed: (emoji) => copyToClipboard(context, emoji),
                onLongPress: (emoji) => onEmojiLongPress?.call(emoji),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class EmojiCard extends StatelessWidget {
  final String emoji;
  final Function(String emoji)? onPressed;
  final Function(String emoji)? onLongPress;
  EmojiCard({
    required this.emoji,
    this.onPressed,
    this.onLongPress,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Theme.of(context).cardColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Center(
              child: Text(
                emoji,
                style: TextStyle(
                  fontSize: 38.0,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => onPressed?.call(emoji),
                onLongPress: () => onLongPress?.call(emoji),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
