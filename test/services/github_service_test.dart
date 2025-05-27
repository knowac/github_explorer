import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_explorer/core/constants/constants.dart';
import 'package:github_explorer/core/constants/urls.dart';
import 'package:github_explorer/core/errors/exceptions.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/models/issue.dart';
import 'package:github_explorer/models/owner.dart';
import 'package:github_explorer/models/pull_request.dart';
import 'package:github_explorer/models/repository_details.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:github_explorer/services/github_service.dart';
import 'package:github_explorer/models/github_repository.dart';

void main() {
  group(
    'GithubService',
    () {
      late Dio dio;
      late DioAdapter dioAdapter;
      late GithubService service;

      setUp(() async {
        await S.load(Locale.fromSubtags(languageCode: 'en'));
        dio = Dio(BaseOptions());
        dioAdapter = DioAdapter(dio: dio);
        dio.httpClientAdapter = dioAdapter;

        service = GithubService(dio);
      });

      test(
        'searchRepos returns list of repositories',
        () async {
          dioAdapter.onGet(
            kSearchReposUrl,
            (server) => server.reply(
              200,
              {
                'items': [
                  {
                    'id': 616,
                    'name': 'test',
                    'full_name': 'test/test',
                    'description': 'test description',
                    "stargazers_count": 616,
                    'language': 'Dart',
                  }
                ]
              },
              delay: const Duration(seconds: 1),
            ),
          );

          final result = await service.searchRepos(
            'flutter',
            page: 1,
            perPage: kGithubPerPage,
          );

          expect(result, isA<List<GithubRepository>>());
          expect(result[0].name, 'test');
          expect(result[0].fullName, 'test/test');
        },
      );

      test(
        'searchRepos throws error if id is null',
        () async {
          dioAdapter.onGet(
            kSearchReposUrl,
            (server) => server.reply(
              200,
              {
                'items': [
                  {
                    'id': null,
                    'name': 'test',
                    'full_name': 'test/test',
                    'description': 'test description',
                    "stargazers_count": 616,
                    'language': 'Dart',
                  }
                ]
              },
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.searchRepos(
              'flutter',
              page: 1,
              perPage: kGithubPerPage,
            ),
            throwsA(isA<TypeError>()),
          );
        },
      );
      test(
        'searchRepos throws RateLimitExceededException',
        () async {
          dioAdapter.onGet(
            kSearchReposUrl,
            (server) => server.throws(
              404,
              DioException.badResponse(
                statusCode: 403,
                response: Response(
                  statusCode: 403,
                  requestOptions: RequestOptions(),
                  data: {
                    'message': 'API rate limit exceeded',
                  },
                ),
                requestOptions: RequestOptions(
                  path: kSearchReposUrl,
                ),
              ),
              delay: const Duration(seconds: 1),
            ),
          );

          try {
            await service.searchRepos(
              'flutter',
              page: 1,
              perPage: kGithubPerPage,
            );
          } on Exception catch (ex) {
            expect(ex, isA<RateLimitExceededException>());
            expect(ex.toString(), S.current.rateLimitError);
          }
        },
      );

      test(
        'searchRepos throws Exception',
        () async {
          dioAdapter.onGet(
            kSearchReposUrl,
            (server) => server.throws(
              400,
              DioException.badResponse(
                statusCode: 400,
                response: Response(
                  statusCode: 400,
                  requestOptions: RequestOptions(),
                  data: {
                    'message': 'Undefined error',
                  },
                ),
                requestOptions: RequestOptions(
                  path: kSearchReposUrl,
                ),
              ),
              delay: const Duration(seconds: 1),
            ),
          );

          try {
            await service.searchRepos(
              'flutter',
              page: 1,
              perPage: kGithubPerPage,
            );
          } on Exception catch (ex) {
            expect(ex is! DioException, isTrue);
            expect(ex, isA<Exception>());
            expect(ex.toString(), 'Exception: ${S.current.generalError}');
          }
        },
      );

      test(
        'fetchRepoDetails returns repository details',
        () async {
          dioAdapter.onGet(
            '/repos/owner/name',
            (server) => server.reply(
              200,
              {
                'name': 'test',
                'description': 'test description',
                "stargazers_count": 616,
                "forks_count": 161,
                'html_url': 'https://www.example.com/html_url',
                'avatar_url': 'https://www.example.com/avatar_url',
                'owner': {
                  'id': 111,
                  'login': 'login',
                  'avatar_url': 'https://www.example.com/avatar_url2',
                },
                'language': 'Dart',
              },
              delay: const Duration(seconds: 1),
            ),
          );

          final result = await service.fetchRepoDetails(
            'owner',
            'name',
          );

          expect(result, isA<RepositoryDetails>());
          expect(result.name, 'test');
          expect(result.description, 'test description');
          expect(result.stars, 616);
          expect(result.forks, 161);
          expect(result.url, 'https://www.example.com/html_url');
          expect(result.avatarUrl, 'https://www.example.com/avatar_url');
          expect(result.owner, isA<Owner>());
          expect(result.owner?.id, 111);
          expect(result.owner?.login, 'login');
          expect(
              result.owner?.avatarUrl, 'https://www.example.com/avatar_url2');
          expect(result.language, 'Dart');
        },
      );

      test(
        'fetchRepoDetails returns repository details if owner is null',
        () async {
          dioAdapter.onGet(
            '/repos/owner/name',
            (server) => server.reply(
              200,
              {
                'name': 'test',
                'description': 'test description',
                "stargazers_count": 616,
                "forks_count": 161,
                'html_url': 'https://www.example.com/html_url',
                'avatar_url': 'https://www.example.com/avatar_url',
                'owner': null,
                'language': 'Dart',
              },
              delay: const Duration(seconds: 1),
            ),
          );

          final result = await service.fetchRepoDetails(
            'owner',
            'name',
          );

          expect(result, isA<RepositoryDetails>());
          expect(result.name, 'test');
          expect(result.description, 'test description');
          expect(result.stars, 616);
          expect(result.forks, 161);
          expect(result.url, 'https://www.example.com/html_url');
          expect(result.avatarUrl, 'https://www.example.com/avatar_url');
          expect(result.owner, isNull);
          expect(result.language, 'Dart');
        },
      );

      test(
        'fetchRepoDetails throws error if name is null',
        () async {
          dioAdapter.onGet(
            '/repos/owner/name',
            (server) => server.reply(
              200,
              {
                'name': null,
                'description': 'test description',
                "stargazers_count": 616,
                "forks_count": 161,
                'html_url': 'https://www.example.com/html_url',
                'avatar_url': 'https://www.example.com/avatar_url',
                'owner': null,
                'language': 'Dart',
              },
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchRepoDetails('owner', 'name'),
            throwsA(isA<TypeError>()),
          );
        },
      );

      test(
        'fetchRepoDetails throws RateLimitExceededException',
        () async {
          dioAdapter.onGet(
            '/repos/owner/name',
            (server) => server.throws(
              404,
              DioException.badResponse(
                statusCode: 403,
                response: Response(
                  statusCode: 403,
                  requestOptions: RequestOptions(),
                  data: {
                    'message': 'API rate limit exceeded',
                  },
                ),
                requestOptions: RequestOptions(
                  path: '/repos/owner/name',
                ),
              ),
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchRepoDetails(
              'owner',
              'name',
            ),
            throwsA(
              predicate(
                (e) => e is RateLimitExceededException,
                S.current.rateLimitError,
              ),
            ),
          );
        },
      );

      test(
        'fetchRepoDetails throws Exception',
        () async {
          dioAdapter.onGet(
            '/repos/owner/name',
            (server) => server.throws(
              400,
              DioException.badResponse(
                statusCode: 400,
                response: Response(
                  statusCode: 400,
                  requestOptions: RequestOptions(),
                  data: {
                    'message': 'Undefined error',
                  },
                ),
                requestOptions: RequestOptions(
                  path: '/repos/owner/name',
                ),
              ),
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchRepoDetails(
              'owner',
              'name',
            ),
            throwsA(
              predicate(
                (e) => e is Exception,
                'Exception: ${S.current.generalError}',
              ),
            ),
          );
        },
      );

      test(
        'fetchIssues returns list of issues',
        () async {
          dioAdapter.onGet(
            'repos/owner/name/issues',
            (server) => server.reply(
              200,
              [
                {
                  'id': 111,
                  'title': 'test',
                  'html_url': 'https://www.example.com/html_url',
                },
                {
                  'id': 222,
                  'title': 'tset',
                  'html_url': 'https://www.example.com/html_url2',
                },
              ],
              delay: const Duration(seconds: 1),
            ),
          );

          final result = await service.fetchIssues(
            'owner',
            'name',
            perPage: kGithubPerPage,
            page: 1,
          );

          expect(result, isA<List<Issue>>());
          expect(result.first.title, 'test');
          expect(result.first.url, 'https://www.example.com/html_url');
          expect(result.first.id, 111);
          expect(result.last.title, 'tset');
          expect(result.last.url, 'https://www.example.com/html_url2');
          expect(result.last.id, 222);
        },
      );

      test(
        'fetchIssues throws error if id is null',
        () async {
          dioAdapter.onGet(
            'repos/owner/name/issues',
            (server) => server.reply(
              200,
              [
                {
                  'id': null,
                  'title': 'test',
                  'html_url': 'https://www.example.com/html_url',
                },
                {
                  'id': 222,
                  'title': 'tset',
                  'html_url': 'https://www.example.com/html_url2',
                },
              ],
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchIssues(
              'owner',
              'name',
              perPage: kGithubPerPage,
              page: 1,
            ),
            throwsA(isA<TypeError>()),
          );
        },
      );

      test(
        'fetchIssues throws RateLimitExceededException',
        () async {
          dioAdapter.onGet(
            'repos/owner/name/issues',
            (server) => server.throws(
              404,
              DioException.badResponse(
                statusCode: 403,
                response: Response(
                  statusCode: 403,
                  requestOptions: RequestOptions(),
                  data: {
                    'message': 'API rate limit exceeded',
                  },
                ),
                requestOptions: RequestOptions(
                  path: 'repos/owner/name/issues',
                ),
              ),
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchIssues(
              'owner',
              'name',
              perPage: kGithubPerPage,
              page: 0,
            ),
            throwsA(
              predicate(
                (e) => e is RateLimitExceededException,
                S.current.rateLimitError,
              ),
            ),
          );
        },
      );

      test(
        'fetchIssues throws Exception',
        () async {
          dioAdapter.onGet(
            'repos/owner/name/issues',
            (server) => server.throws(
              400,
              DioException.badResponse(
                statusCode: 400,
                response: Response(
                  statusCode: 400,
                  requestOptions: RequestOptions(),
                  data: {
                    'message': 'Undefined error',
                  },
                ),
                requestOptions: RequestOptions(
                  path: 'repos/owner/name/issues',
                ),
              ),
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchIssues(
              'owner',
              'name',
              perPage: kGithubPerPage,
              page: 0,
            ),
            throwsA(
              predicate(
                (e) => e is Exception,
                'Exception: ${S.current.generalError}',
              ),
            ),
          );
        },
      );

      test(
        'fetchPullRequests returns list of pull requests',
        () async {
          dioAdapter.onGet(
            'repos/owner/name/pulls',
            (server) => server.reply(
              200,
              [
                {
                  'id': 111,
                  'title': 'test',
                  'html_url': 'https://www.example.com/html_url',
                },
                {
                  'id': 222,
                  'title': 'tset',
                  'html_url': 'https://www.example.com/html_url2',
                },
              ],
              delay: const Duration(seconds: 1),
            ),
          );

          final result = await service.fetchPullRequests(
            'owner',
            'name',
            perPage: kGithubPerPage,
            page: 1,
          );

          expect(result, isA<List<PullRequest>>());
          expect(result.first.title, 'test');
          expect(result.first.url, 'https://www.example.com/html_url');
          expect(result.first.id, 111);
          expect(result.last.title, 'tset');
          expect(result.last.url, 'https://www.example.com/html_url2');
          expect(result.last.id, 222);
        },
      );

      test(
        'fetchPullRequests throws error if id is null',
        () async {
          dioAdapter.onGet(
            'repos/owner/name/pulls',
            (server) => server.reply(
              200,
              [
                {
                  'id': null,
                  'title': 'test',
                  'html_url': 'https://www.example.com/html_url',
                },
                {
                  'id': 222,
                  'title': 'tset',
                  'html_url': 'https://www.example.com/html_url2',
                },
              ],
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchPullRequests(
              'owner',
              'name',
              perPage: kGithubPerPage,
              page: 1,
            ),
            throwsA(isA<TypeError>()),
          );
        },
      );

      test(
        'fetchPullRequests returns throws RateLimitExceededException',
        () async {
          dioAdapter.onGet(
            'repos/owner/name/pulls',
            (server) => server.throws(
              404,
              DioException.badResponse(
                statusCode: 403,
                response: Response(
                  statusCode: 403,
                  requestOptions: RequestOptions(),
                  data: {
                    'message': 'API rate limit exceeded',
                  },
                ),
                requestOptions: RequestOptions(
                  path: 'repos/owner/name/pulls',
                ),
              ),
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchPullRequests(
              'owner',
              'name',
              perPage: kGithubPerPage,
              page: 0,
            ),
            throwsA(
              predicate(
                (e) => e is RateLimitExceededException,
                S.current.rateLimitError,
              ),
            ),
          );
        },
      );

      test(
        'fetchPullRequests throws Exception',
        () async {
          dioAdapter.onGet(
            'repos/owner/name/pulls',
            (server) => server.throws(
              400,
              DioException.badResponse(
                statusCode: 400,
                response: Response(
                  statusCode: 400,
                  requestOptions: RequestOptions(),
                  data: {
                    'message': 'Undefined error',
                  },
                ),
                requestOptions: RequestOptions(
                  path: 'repos/owner/name/pulls',
                ),
              ),
              delay: const Duration(seconds: 1),
            ),
          );

          expect(
            () async => await service.fetchPullRequests(
              'owner',
              'name',
              perPage: kGithubPerPage,
              page: 0,
            ),
            throwsA(
              predicate(
                (e) => e is Exception,
                'Exception: ${S.current.generalError}',
              ),
            ),
          );
        },
      );
    },
  );
}
