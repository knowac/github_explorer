import 'package:core/generated/l10n.dart';
import 'package:core/widgets/boxes/default_horizontal_sized_box.dart';
import 'package:core/widgets/boxes/default_vertical_sized_box.dart';
import 'package:core/widgets/texts/headline_large_text.dart';
import 'package:core/widgets/texts/headline_small_text.dart';
import 'package:flutter/material.dart';

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
