import 'package:flutter/material.dart';

class BodyLargeText extends StatelessWidget {
  final String text;

  // The Text with the style of Theme's body medium
  const BodyLargeText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
