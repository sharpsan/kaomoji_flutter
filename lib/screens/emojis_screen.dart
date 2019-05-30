import 'package:flutter/material.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:kaomoji_flutter/constants/constants.dart';

class EmojisScreen extends StatelessWidget {
  final emojiData;

  EmojisScreen({this.emojiData});

  void copyToClipboard(BuildContext context, String text) {
    ClipboardManager.copyToClipBoard(text).then((result) {
      final snackBar = SnackBar(
        content: Text('Face copied to clipboard'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
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
        return Container(
          height: 70.0,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            color: Theme.of(context).cardColor,
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Center(
                  child: Text(
                    emojiData[index],
                    style: TextStyle(
                      fontSize: 38.0,
                    ),
                  ),
                ),
              ),
              new Positioned.fill(
                child: new Material(
                  color: Colors.transparent,
                  child: new InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () => copyToClipboard(context, emojiData[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
