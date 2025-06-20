import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:repo_search/src/data/data_sources/repo_search_data_source.dart';
import 'package:repo_search/src/data/repositories/repo_search_repository_impl.dart';
import 'package:repo_search/src/domain/entities/github_repository_entity.dart';

import 'repo_search_repository_impl_test.mocks.dart';

@GenerateMocks([RepoSearchDataSource])
void main() {
  late RepoSearchRepositoryImpl repository;
  late MockRepoSearchDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRepoSearchDataSource();
    repository = RepoSearchRepositoryImpl(mockDataSource);
  });

  const tQuery = 'flutter';
  final tRawResponse = [
    {
      "id": 123,
      "name": "flutter",
      "full_name": "flutter-flutter",
      "language": "dart",
      "description": "Flutter makes it easy and fast to build...",
      "stargazers_count": 150000,
    }
  ];
  // String? language,
  final tExpectedEntities = [
    const GithubRepositoryEntity(
      id: 123,
      name: 'flutter',
      fullName: 'flutter-flutter',
      language: 'dart',
      description: 'Flutter makes it easy and fast to build...',
      stargazersCount: 150000,
    )
  ];

  test(
      'should return list of RepoSearchItemEntity when call to data source is successful',
      () async {
    when(mockDataSource.search(any, perPage: 1, page: 0))
        .thenAnswer((_) async => tRawResponse);

    final result =
        await repository.searchRepositories(tQuery, page: 0, perPage: 1);

    expect(result, tExpectedEntities);
    verify(mockDataSource.search(tQuery, perPage: 1, page: 0));
    verifyNoMoreInteractions(mockDataSource);
  });

  test(
      'should rethrow the exception when the call to data source is unsuccessful',
      () async {
    final dioException = DioException(requestOptions: RequestOptions(path: ''));
    when(mockDataSource.search(any, perPage: 1, page: 0))
        .thenThrow(dioException);

    final call = repository.searchRepositories;

    expect(
        () => call(tQuery, perPage: 1, page: 0), throwsA(isA<DioException>()));
    verify(mockDataSource.search(tQuery, perPage: 1, page: 0));
    verifyNoMoreInteractions(mockDataSource);
  });
}
