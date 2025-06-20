import 'package:core/constants/constants.dart';
import 'package:flutter/material.dart';

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
