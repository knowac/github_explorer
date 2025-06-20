import 'package:repo_search/src/data/data_sources/repo_search_data_source.dart';
import 'package:repo_search/src/domain/entities/github_repository_entity.dart';
import 'package:repo_search/src/domain/repositories/repo_search_repository.dart';

class RepoSearchRepositoryImpl implements RepoSearchRepository {
  RepoSearchRepositoryImpl(this._dataSource);
  final RepoSearchDataSource _dataSource;

  @override
  Future<List<GithubRepositoryEntity>> searchRepositories(
    String query, {
    required int page,
    required int perPage,
  }) async {
    final items = await _dataSource.search(query, page: page, perPage: perPage);
    return items.map((json) => GithubRepositoryEntity.fromJson(json)).toList();
  }
}
