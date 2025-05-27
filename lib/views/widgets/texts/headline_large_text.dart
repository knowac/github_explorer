import 'package:flutter/material.dart';

class HeadlineLargeText extends StatelessWidget {
  final String text;

  // The Text with the style of Theme's headline large
  const HeadlineLargeText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
