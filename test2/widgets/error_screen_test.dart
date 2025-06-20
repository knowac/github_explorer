import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/views/screens/error_screen.dart';
import 'package:github_explorer/views/widgets/texts/headline_large_text.dart';
import 'package:github_explorer/views/widgets/texts/headline_small_text.dart';

void main() {
  late Widget app;
  final exception = Exception('test_error');

  group('ErrorScreen', () {
    setUp(() async {
      await S.load(Locale.fromSubtags(languageCode: 'en'));

      app = MaterialApp(
        home: Scaffold(
          body: ErrorScreen(error: Exception('test_error')),
        ),
      );
    });
    testWidgets('ErrorScreen has a proper title', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: app,
        ),
      );

      expect(find.byType(Text), findsNWidgets(3));
      expect(find.text(S.current.error), findsOneWidget);
    });
    testWidgets('ErrorScreen has a proper headline', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: app,
        ),
      );

      expect(find.byType(HeadlineLargeText), findsOneWidget);
      expect(find.text(S.current.pageNotExist), findsOneWidget);
    });
    testWidgets('ErrorScreen has a proper description', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: app,
        ),
      );

      expect(find.byType(HeadlineSmallText), findsOneWidget);
      expect(find.text(exception.toString()), findsOneWidget);
    });
  });
}
