import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmojisScreen extends StatelessWidget {
  final List<String> emojiData;
  EmojisScreen({
    required this.emojiData,
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
    return ListView.builder(
      itemCount: emojiData.length,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      itemBuilder: (context, index) {
        return EmojiCard(
          emoji: emojiData[index],
          onPressed: () => copyToClipboard(context, emojiData[index]),
        );
      },
    );
  }
}

class EmojiCard extends StatelessWidget {
  final String emoji;
  final VoidCallback? onPressed;
  EmojiCard({
    required this.emoji,
    this.onPressed,
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
                onTap: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
