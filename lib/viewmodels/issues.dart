import 'package:github_explorer/core/constants/constants.dart';
import 'package:github_explorer/models/issue.dart';
import 'package:github_explorer/services/github_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'issues.g.dart';

@riverpod
class Issues extends _$Issues {
  String _currentOwner = '';
  String _currentName = '';
  int _currentPage = 0;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  final List<Issue> _issues = [];

  @override
  FutureOr<List<Issue>> build() async {
    return [];
  }

  Future<void> fetch(
    String owner,
    String name,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        _currentPage = 1;
        _hasMore = true;
        _currentName = name;
        _currentOwner = owner;

        final issues = await ref.read(githubServiceProvider).fetchIssues(
              _currentOwner,
              _currentName,
              perPage: kGithubPerPage,
              page: _currentPage,
            );

        _issues.clear();
        _issues.addAll(issues);
        return issues;
      },
    );
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    _currentPage++;

    try {
      final issues = await ref.read(githubServiceProvider).fetchIssues(
            _currentOwner,
            _currentName,
            perPage: kGithubPerPage,
            page: _currentPage,
          );
      if (issues.isEmpty) {
        _hasMore = false;
      } else {
        state = AsyncValue.data([...state.value ?? [], ...issues]);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isLoadingMore = false;
    }
  }
}
