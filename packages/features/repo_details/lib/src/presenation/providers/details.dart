import 'package:repo_details/src/data/providers/repo_details_repository_provider.dart';
import 'package:repo_details/src/domain/entities/repository_details_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'details.g.dart';

@riverpod
class Details extends _$Details {
  @override
  FutureOr<RepositoryDetailsEntity?> build() async {
    return null;
  }

  Future<void> loadRepoDetails(String owner, String name) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () =>
          ref.read(repoDetailsRepositoryProvider).fetchRepoDetails(owner, name),
    );
  }
}
