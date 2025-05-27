import 'package:flutter/material.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/views/widgets/boxes/default_horizontal_sized_box.dart';
import 'package:github_explorer/views/widgets/boxes/default_vertical_sized_box.dart';
import 'package:github_explorer/views/widgets/texts/headline_large_text.dart';
import 'package:github_explorer/views/widgets/texts/headline_small_text.dart';

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.error,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.error,
                color: Theme.of(context).colorScheme.error,
                size: 48,
              ),
              DefaultHorizontalSizedBox(),
              Center(
                child: HeadlineLargeText(
                  S.current.pageNotExist,
                ),
              ),
              DefaultVerticalSizedBox(),
              if (error != null)
                Center(
                  child: HeadlineSmallText(
                    error.toString(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
