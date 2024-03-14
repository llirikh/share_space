import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleScreenHyperlink extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle? textStyle;

  const ArticleScreenHyperlink({
    super.key,
    required this.text,
    required this.url,
    required this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 10),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
      onTap: () => launchUrlString(url)
    );
  }
}
