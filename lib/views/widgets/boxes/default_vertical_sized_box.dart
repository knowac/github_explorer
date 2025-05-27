import 'package:flutter/material.dart';
import 'package:github_explorer/core/constants/constants.dart';

/// Sized box of height kDefaultVerticalPadding
class DefaultVerticalSizedBox extends StatelessWidget {
  const DefaultVerticalSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kDefaultVerticalPadding,
    );
  }
}
