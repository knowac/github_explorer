import 'package:flutter/material.dart';
import 'package:github_explorer/core/constants/constants.dart';

/// Sized box of width kDefaultVerticalPadding
class DefaultHorizontalSizedBox extends StatelessWidget {
  const DefaultHorizontalSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kDefaultVerticalPadding,
    );
  }
}
