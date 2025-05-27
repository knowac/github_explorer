import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/models/github_repository.dart';
import 'package:github_explorer/services/github_service.dart';
import 'package:github_explorer/services/github_service_provider.dart';
import 'package:github_explorer/views/screens/search_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_screen_test.mocks.dart';

@GenerateMocks([GithubService])
void main() {
  late MockGithubService mockService;

  final repos = [
    GithubRepository(
        fullName: 'flutter/flutter',
        id: 1,
        name: "flutter",
        stargazersCount: 1),
    GithubRepository(
        fullName: 'flutter/plugins',
        id: 2,
        name: "plugins",
        stargazersCount: 2),
  ];

  late Widget app;

  group('SearchScreen', () {
    setUp(() async {
      mockService = MockGithubService();
      await S.load(Locale.fromSubtags(languageCode: 'en'));

      app = MaterialApp(
        home: Scaffold(
          body: SearchScreen(),
        ),
      );
    });

    testWidgets('SearchScreen fills the TextField', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            githubServiceProvider.overrideWithValue(mockService),
          ],
          child: app,
        ),
      );

      when(
        mockService.searchRepos(
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer(
        (_) async => repos,
      );

      // Then
      await tester.enterText(find.byType(TextField), 'flutter');
      await tester.pump(const Duration(milliseconds: 5000));

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('flutter'), findsOneWidget);
    });

    testWidgets('SearchScreen TextField has correct records in Listview',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            githubServiceProvider.overrideWithValue(mockService),
          ],
          child: app,
        ),
      );

      when(
        mockService.searchRepos(
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer(
        (_) async => repos,
      );

      // Then
      await tester.enterText(find.byType(TextField), 'flutter');
      await tester.pump(const Duration(milliseconds: 5000));

      expect(find.byType(ListTile), findsAtLeastNWidgets(2));
      expect(find.text('flutter/flutter'), findsNWidgets(1));
      expect(find.text('flutter/plugins'), findsNWidgets(1));
    });

    testWidgets('SearchScreen has correct semantics', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            githubServiceProvider.overrideWithValue(mockService),
          ],
          child: app,
        ),
      );

      when(
        mockService.searchRepos(
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer(
        (_) async => repos,
      );

      // Then
      await tester.enterText(find.byType(TextField), 'flutter');
      await tester.pump(const Duration(milliseconds: 5000));
      final textFieldSemantics = tester.getSemantics(find.byType(TextField));
      final clearButtonSemantics = tester.getSemantics(
        find.bySemanticsLabel(S.current.clearQueryButtonAccessibility),
      );
      final searchButtonSemantics = tester.getSemantics(
        find.bySemanticsLabel(S.current.searchButtonAccessibility),
      );

      expect(textFieldSemantics.hasFlag(SemanticsFlag.isTextField), true);
      expect(textFieldSemantics.hasFlag(SemanticsFlag.isEnabled), true);
      expect(textFieldSemantics.label, S.current.enterKeywordHint);
      expect(clearButtonSemantics.hasFlag(SemanticsFlag.isButton), true);
      expect(searchButtonSemantics.hasFlag(SemanticsFlag.isButton), true);
      expect(clearButtonSemantics.hasFlag(SemanticsFlag.isEnabled), true);
      expect(searchButtonSemantics.hasFlag(SemanticsFlag.isEnabled), true);
    });
  });
}
