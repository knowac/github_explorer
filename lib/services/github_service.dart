import 'package:dio/dio.dart';
import '../../packages/core/lib/constants/urls.dart';
import '../../packages/core/lib/errors/exceptions.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/models/github_repository_entity.dart';
import 'package:github_explorer/models/issue_entity.dart';
import 'package:github_explorer/models/pull_request_entity.dart';
import 'package:github_explorer/models/repository_details_entity.dart';
import '../../packages/core/lib/network/api_client.dart';

class GithubService {
  final Dio _dio;
  GithubService([Dio? dio]) : _dio = dio ?? ApiClient.instance;

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
