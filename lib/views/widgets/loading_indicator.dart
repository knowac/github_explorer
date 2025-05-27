import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  /// Default loading indicator for the app
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
