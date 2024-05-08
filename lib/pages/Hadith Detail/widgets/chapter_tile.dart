import 'package:flutter/material.dart';

import '../../../utils/textStyle.dart';

class ChapterTile extends StatelessWidget {
  const ChapterTile({
    super.key,
    required this.chapterNumber,
    required this.chapterTitle,
    this.preface,
  });

  final String chapterNumber;
  final String chapterTitle;
  final String? preface;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff151C24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: kToolbarHeight,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: RichText(
              text: TextSpan(
                text: chapterNumber,
                style: chapterIdTextStyle,
                children: [
                  TextSpan(
                    text: chapterNumber == chapterTitle ? "" : " $chapterTitle",
                    style: bodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          if (preface != null && preface!.isNotEmpty) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
              child: Text(
                preface!,
                style: bodyTextStyle,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
