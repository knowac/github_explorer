import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  /// Adds possibility to override the indicator in tests as infinite animation
  /// is causing pumpAndSettle to time out.
  static Widget Function()? overrideBuilder;

  /// Default loading indicator for the app
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    if (overrideBuilder != null) {
      return overrideBuilder!();
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
