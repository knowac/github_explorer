import 'package:repo_details/src/domain/entities/issue_entity.dart';
import 'package:repo_details/src/domain/entities/pull_request_entity.dart';
import 'package:repo_details/src/domain/entities/repository_details_entity.dart';

abstract class RepoDetailsRepository {
  Future<RepositoryDetailsEntity> fetchRepoDetails(String owner, String name);
  Future<List<IssueEntity>> fetchIssues(
    String owner,
    String name, {
    required int page,
    required int perPage,
  });
  Future<List<PullRequestEntity>> fetchPullRequests(
    String owner,
    String name, {
    required int page,
    required int perPage,
  });
}
