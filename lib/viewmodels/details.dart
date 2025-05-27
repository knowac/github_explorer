import 'package:github_explorer/models/repository_details.dart';
import 'package:github_explorer/services/github_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'details.g.dart';

@riverpod
class Details extends _$Details {
  @override
  FutureOr<RepositoryDetails?> build() async {
    return null;
  }

  Future<void> loadRepoDetails(String owner, String name) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(githubServiceProvider).fetchRepoDetails(owner, name),
    );
  }
}
