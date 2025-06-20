import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {
  final double? intent;

  /// Default list items divider of height 0
  ///
  /// @param double? intent - symmetric horizontal intent for the divider
  const ListSeparator(
    this.intent, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      indent: intent,
      endIndent: intent,
    );
  }
}
