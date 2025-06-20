import 'package:repo_search/src/data/providers/repo_search_provider.dart';
import 'package:repo_search/src/data/repositories/repo_search_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'repo_search_repository_provider.g.dart';

@riverpod
RepoSearchRepositoryImpl repoSearchRepository(Ref ref) {
  return RepoSearchRepositoryImpl(
      ref.watch(repoSearchRemoteDataSourceProvider));
}
