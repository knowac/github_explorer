import 'package:core/errors/exceptions.dart';
import 'package:core/generated/l10n.dart';
import 'package:dio/dio.dart';

class RepoDetailsDataSource {
  RepoDetailsDataSource(this._dio);
  final Dio _dio;

  Future<dynamic> fetchRepoDetails(String owner, String name) async {
    try {
      final response = await _dio.get('/repos/$owner/$name');
      return response.data as Map<String, dynamic>;
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

  Future<List<dynamic>> fetchIssues(
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
      return response.data as List;
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

  Future<List<dynamic>> fetchPullRequests(
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
      return response.data as List;
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
