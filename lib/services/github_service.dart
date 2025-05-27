import 'package:dio/dio.dart';
import 'package:github_explorer/core/constants/urls.dart';
import 'package:github_explorer/core/errors/exceptions.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/models/github_repository.dart';
import 'package:github_explorer/models/issue.dart';
import 'package:github_explorer/models/pull_request.dart';
import 'package:github_explorer/models/repository_details.dart';
import 'package:github_explorer/core/network/api_client.dart';

class GithubService {
  final Dio _dio;
  GithubService([Dio? dio]) : _dio = dio ?? ApiClient.instance;

  Future<List<GithubRepository>> searchRepos(
    String query, {
    required int page,
    required int perPage,
  }) async {
    try {
      final response = await _dio.get(
        kSearchReposUrl,
        queryParameters: {
          'q': query,
          'order': 'asc',
          'per_page': perPage,
          'page': page,
        },
      );
      final items = response.data['items'] as List;
      return items.map((json) => GithubRepository.fromJson(json)).toList();
    } on DioException catch (ex) {
      if (ex.response?.statusCode == 403 &&
          (ex.response?.data['message'] as String?)
                  ?.contains('API rate limit exceeded') ==
              true) {
        throw RateLimitExceededException(S.current.rateLimitError);
      } else {
        throw Exception(S.current.generalError);
      }
    }
  }

  Future<RepositoryDetails> fetchRepoDetails(String owner, String name) async {
    try {
      final response = await _dio.get('/repos/$owner/$name');
      return RepositoryDetails.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (ex) {
      if (ex.response?.statusCode == 403 &&
          (ex.response?.data['message'] as String?)
                  ?.contains('API rate limit exceeded') ==
              true) {
        throw RateLimitExceededException(S.current.rateLimitError);
      } else {
        throw Exception(S.current.generalError);
      }
    }
  }

  Future<List<Issue>> fetchIssues(
    String owner,
    String name, {
    required int page,
    required int perPage,
  }) async {
    try {
      final response = await _dio.get(
        'repos/$owner/$name/issues',
        queryParameters: {
          'sort': 'created',
          'state': 'open',
          'pull_request': false,
        },
      );
      final list = (response.data as List)
          .map(
            (entry) => Issue.fromJson(entry as Map<String, dynamic>),
          )
          .toList();
      return list;
    } on DioException catch (ex) {
      if (ex.response?.statusCode == 403 &&
          (ex.response?.data['message'] as String?)
                  ?.contains('API rate limit exceeded') ==
              true) {
        throw RateLimitExceededException(S.current.rateLimitError);
      } else {
        throw Exception(S.current.generalError);
      }
    }
  }

  Future<List<PullRequest>> fetchPullRequests(
    String owner,
    String name, {
    required int page,
    required int perPage,
  }) async {
    try {
      final response = await _dio.get(
        'repos/$owner/$name/pulls',
        queryParameters: {
          'sort': 'created',
          'direction': 'desc',
          'state': 'open',
        },
      );
      final list = (response.data as List)
          .map(
            (entry) => PullRequest.fromJson(entry as Map<String, dynamic>),
          )
          .toList();
      return list;
    } on DioException catch (ex) {
      if (ex.response?.statusCode == 403 &&
          (ex.response?.data['message'] as String?)
                  ?.contains('API rate limit exceeded') ==
              true) {
        throw RateLimitExceededException(S.current.rateLimitError);
      } else {
        throw Exception(S.current.generalError);
      }
    }
  }
}
