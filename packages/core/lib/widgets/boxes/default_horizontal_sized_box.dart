import 'package:core/constants/constants.dart';
import 'package:flutter/material.dart';

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
