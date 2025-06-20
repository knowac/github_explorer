import 'package:repo_details/src/data/data_sources/repo_details_data_source.dart';
import 'package:repo_details/src/domain/entities/issue_entity.dart';
import 'package:repo_details/src/domain/entities/pull_request_entity.dart';
import 'package:repo_details/src/domain/entities/repository_details_entity.dart';
import 'package:repo_details/src/domain/repositories/repo_details_repository.dart';

class RepoDetailsRepositoryImpl implements RepoDetailsRepository {
  RepoDetailsRepositoryImpl(this._dataSource);

  final RepoDetailsDataSource _dataSource;

  @override
  Future<List<IssueEntity>> fetchIssues(String owner, String name,
      {required int page, required int perPage}) async {
    return (await _dataSource.fetchIssues(owner, name,
            page: page, perPage: perPage))
        .map((entry) => IssueEntity.fromJson(entry as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<PullRequestEntity>> fetchPullRequests(String owner, String name,
      {required int page, required int perPage}) async {
    return (await _dataSource.fetchPullRequests(owner, name,
            page: page, perPage: perPage))
        .map(
          (entry) => PullRequestEntity.fromJson(entry as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<RepositoryDetailsEntity> fetchRepoDetails(
      String owner, String name) async {
    return RepositoryDetailsEntity.fromJson(await _dataSource.fetchRepoDetails(
        owner, name) as Map<String, dynamic>);
  }
}
