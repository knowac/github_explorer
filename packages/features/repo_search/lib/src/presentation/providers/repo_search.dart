import 'package:repo_search/src/data/providers/repo_search_repository_provider.dart';
import 'package:repo_search/src/domain/entities/github_repository_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:core/constants/constants.dart';

part 'repo_search.g.dart';

@Riverpod(keepAlive: true)
class RepoSearch extends _$RepoSearch {
  @override
  FutureOr<List<GithubRepositoryEntity>> build() async {
    return [];
  }

  String _currentQuery = '';
  int _currentPage = 0;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  final List<GithubRepositoryEntity> _repos = [];

  Future<void> search([String? query]) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      _currentQuery = query ?? _currentQuery;
      _currentPage = 1;
      _hasMore = true;
      final results =
          await ref.read(repoSearchRepositoryProvider).searchRepositories(
                _currentQuery,
                page: _currentPage,
                perPage: kGithubPerPage,
              );
      _repos.clear();
      _repos.addAll(results);
      return _repos;
    });
  }

  Future<void> clearSearch([String? query]) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      _currentQuery = '';
      _currentPage = 1;
      _hasMore = true;
      _repos.clear();
      return _repos;
    });
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    _currentPage++;

    try {
      final moreRepos =
          await ref.read(repoSearchRepositoryProvider).searchRepositories(
                _currentQuery,
                page: _currentPage,
                perPage: kGithubPerPage,
              );
      if (moreRepos.isEmpty) {
        _hasMore = false;
      } else {
        state = AsyncValue.data([...state.value ?? [], ...moreRepos]);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isLoadingMore = false;
    }
  }
}
