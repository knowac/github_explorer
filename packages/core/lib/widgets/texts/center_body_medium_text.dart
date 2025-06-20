import 'package:flutter/material.dart';

class CenterBodyMediumText extends StatelessWidget {
  final String text;

  // The Text with the style of Theme's body medium
  const CenterBodyMediumText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }
}
