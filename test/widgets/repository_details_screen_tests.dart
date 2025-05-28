import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/models/issue.dart';
import 'package:github_explorer/models/owner.dart';
import 'package:github_explorer/models/pull_request.dart';
import 'package:github_explorer/models/repository_details.dart';
import 'package:github_explorer/services/github_service.dart';
import 'package:github_explorer/services/github_service_provider.dart';
import 'package:github_explorer/views/screens/repository_details_screen.dart';
import 'package:github_explorer/views/widgets/loading_indicator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'repository_details_screen_tests.mocks.dart';

@GenerateMocks([GithubService])
void main() {
  late MockGithubService mockService;

  late Widget app;

  final detail = RepositoryDetails(
    name: 'flutter',
    description: 'flutter/flutter',
    stars: 1,
    forks: 1,
    url: 'https://example.com',
    avatarUrl: 'https://example.com/avatar_url',
    owner: Owner(
      id: 1,
      login: 'login',
      avatarUrl: 'https://example.com/avatar_url',
    ),
    language: 'Dart',
  );
  final issues = [
    Issue(id: 1, title: 'Issue1', url: 'url1'),
    Issue(id: 2, title: 'Issue2', url: 'url2'),
    Issue(id: 3, title: 'Issue3', url: 'url3'),
  ];
  final pulls = [
    PullRequest(id: 1, title: 'Pull1', url: 'url1'),
    PullRequest(id: 2, title: 'Pull2', url: 'url2'),
    PullRequest(id: 3, title: 'Pull3', url: 'url3'),
    PullRequest(id: 4, title: 'Pull4', url: 'url4'),
  ];

  group('RepositoryDetailsScreen', () {
    setUp(() async {
      mockService = MockGithubService();
      await S.load(Locale.fromSubtags(languageCode: 'en'));

      // Need to override as infinite spinner animation is causing timeouts
      LoadingIndicator.overrideBuilder = () => const Text('MockLoading');

      app = MaterialApp(
        home: Scaffold(
          body: RepositoryDetailsScreen(owner: 'owner', name: 'name'),
        ),
      );
    });

    tearDown(() {
      LoadingIndicator.overrideBuilder = null;
    });

    testWidgets('RepositoryDetailsScreen has a card', (tester) async {
      when(mockService.fetchRepoDetails(any, any))
          .thenAnswer((_) async => detail);

      when(
        mockService.fetchIssues(
          any,
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer((_) async => issues);

      when(
        mockService.fetchPullRequests(
          any,
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer((_) async => pulls);

      await mockNetworkImagesFor(() async => await tester.pumpWidget(
            ProviderScope(
              overrides: [
                githubServiceProvider.overrideWithValue(mockService),
              ],
              child: app,
            ),
          ));

      // Then
      await mockNetworkImagesFor(
          () async => await tester.pump(const Duration(milliseconds: 1000)));

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('RepositoryDetailsScreen has a 2 tabs', (tester) async {
      when(mockService.fetchRepoDetails(any, any))
          .thenAnswer((_) async => detail);

      when(
        mockService.fetchIssues(
          any,
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer((_) async => issues);

      when(
        mockService.fetchPullRequests(
          any,
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer((_) async => pulls);

      await mockNetworkImagesFor(() async => await tester.pumpWidget(
            ProviderScope(
              overrides: [
                githubServiceProvider.overrideWithValue(mockService),
              ],
              child: app,
            ),
          ));

      // Then
      await mockNetworkImagesFor(
          () async => await tester.pump(const Duration(milliseconds: 1000)));

      expect(find.byType(Tab), findsNWidgets(2));
    });

    testWidgets('RepositoryDetailsScreen has correct amount of elements in tab',
        (tester) async {
      when(mockService.fetchRepoDetails(any, any))
          .thenAnswer((_) async => detail);

      when(
        mockService.fetchIssues(
          any,
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer((_) async => issues);

      when(
        mockService.fetchPullRequests(
          any,
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer((_) async => pulls);

      await mockNetworkImagesFor(
        () async => await tester.pumpWidget(
          ProviderScope(
            overrides: [
              githubServiceProvider.overrideWithValue(mockService),
            ],
            child: app,
          ),
        ),
      );

      // Then
      await mockNetworkImagesFor(
          () async => await tester.pump(const Duration(milliseconds: 1000)));
      expect(find.textContaining(S.current.issues, findRichText: true),
          findsOneWidget);

      expect(find.byType(Tab).at(0), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(3));
      expect(find.text('Issue1'), findsOneWidget);
      expect(find.text('Issue2'), findsOneWidget);
      expect(find.text('Issue3'), findsOneWidget);
      expect(find.text('Issue4'), findsNothing);

      // Switch tab
      final secondTab = find.byType(Tab).at(1);
      expect(find.textContaining(S.current.pullRequests), findsOneWidget);
      expect(secondTab, findsOneWidget);

      await tester.tap(secondTab);
      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.byType(ListTile), findsNWidgets(4));
      expect(find.textContaining('Pull1'), findsOneWidget);
      expect(find.textContaining('Pull2'), findsOneWidget);
      expect(find.textContaining('Pull3'), findsOneWidget);
      expect(find.textContaining('Pull4'), findsOneWidget);
    });

    testWidgets('RepositoryDetailsScreen card has correct text',
        (tester) async {
      when(mockService.fetchRepoDetails(any, any))
          .thenAnswer((_) async => detail);

      when(
        mockService.fetchIssues(
          any,
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer((_) async => issues);

      when(
        mockService.fetchPullRequests(
          any,
          any,
          page: anyNamed('page'),
          perPage: anyNamed('perPage'),
        ),
      ).thenAnswer((_) async => pulls);

      await mockNetworkImagesFor(
        () async => await tester.pumpWidget(
          ProviderScope(
            overrides: [
              githubServiceProvider.overrideWithValue(mockService),
            ],
            child: app,
          ),
        ),
      );

      // Then
      await mockNetworkImagesFor(
          () async => await tester.pump(const Duration(milliseconds: 1000)));

      // Check card elements before click
      expect(find.byType(Card), findsNWidgets(1));
      expect(find.text(detail.name), findsOneWidget);
      expect(find.text(detail.description), findsOneWidget);
      expect(find.text('${S.current.language}: ${detail.language}'),
          findsOneWidget);
      expect(find.text('${S.current.stars}: ${detail.stars}'), findsOneWidget);

      // Check if the card is folded after click
      await tester.tap(find.byType(Card));
      await tester.pump();

      expect(find.text(detail.name), findsOneWidget);
      expect(find.text(detail.description), findsNothing);
      expect(find.text(detail.url), findsNothing);
      expect(
          find.text('${S.current.language}: ${detail.language}'), findsNothing);
      expect(find.text('${S.current.stars}: ${detail.stars}'), findsNothing);
    });
  });
}
