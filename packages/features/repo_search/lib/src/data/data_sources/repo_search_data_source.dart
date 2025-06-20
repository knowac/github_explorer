import 'package:core/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:core/constants/urls.dart';
import 'package:core/errors/exceptions.dart';

class RepoSearchDataSource {
  RepoSearchDataSource(this._dio);
  final Dio _dio;

  Future<List<dynamic>> search(
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
      return response.data['items'] as List;
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
