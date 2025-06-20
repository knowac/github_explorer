import 'package:repo_search/src/domain/entities/github_repository_entity.dart';

abstract class RepoSearchRepository {
  Future<List<GithubRepositoryEntity>> searchRepositories(
    String query, {
    required int page,
    required int perPage,
  });
}
