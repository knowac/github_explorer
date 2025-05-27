import 'package:github_explorer/core/constants/constants.dart';
import 'package:github_explorer/models/github_repository.dart';
import 'package:github_explorer/services/github_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

@Riverpod(keepAlive: true)
class Search extends _$Search {
  String _currentQuery = '';
  int _currentPage = 0;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  final List<GithubRepository> _repos = [];

  @override
  FutureOr<List<GithubRepository>> build() async {
    return [];
  }

  Future<void> search([String? query]) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      _currentQuery = query ?? _currentQuery;
      _currentPage = 1;
      _hasMore = true;
      final results = await ref.read(githubServiceProvider).searchRepos(
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
      final moreRepos = await ref.read(githubServiceProvider).searchRepos(
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
