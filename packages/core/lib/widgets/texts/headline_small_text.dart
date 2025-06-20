import 'package:flutter/material.dart';

class HeadlineSmallText extends StatelessWidget {
  final String text;

  /// The Text with the style of Theme's headline small
  const HeadlineSmallText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
