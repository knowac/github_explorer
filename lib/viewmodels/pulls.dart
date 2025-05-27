import 'package:github_explorer/models/pull_request.dart';
import 'package:github_explorer/services/github_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/constants/constants.dart';

part 'pulls.g.dart';

@riverpod
class Pulls extends _$Pulls {
  String _currentOwner = '';
  String _currentName = '';
  int _currentPage = 0;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  final List<PullRequest> _pulls = [];

  @override
  FutureOr<List<PullRequest>> build() async {
    return [];
  }

  Future<void> fetch(
    String owner,
    String name,
  ) async {
    _currentPage = 1;
    _hasMore = true;
    _currentName = name;
    _currentOwner = owner;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        _currentPage = 1;
        _hasMore = true;
        _currentName = name;
        _currentOwner = owner;

        final pulls = await ref.read(githubServiceProvider).fetchPullRequests(
              _currentOwner,
              _currentName,
              perPage: kGithubPerPage,
              page: _currentPage,
            );

        _pulls.clear();
        _pulls.addAll(pulls);
        return pulls;
      },
    );
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    _currentPage++;

    try {
      final pulls = await ref.read(githubServiceProvider).fetchPullRequests(
            _currentOwner,
            _currentName,
            perPage: kGithubPerPage,
            page: _currentPage,
          );
      if (pulls.isEmpty) {
        _hasMore = false;
      } else {
        state = AsyncValue.data([...state.value ?? [], ...pulls]);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isLoadingMore = false;
    }
  }
}
