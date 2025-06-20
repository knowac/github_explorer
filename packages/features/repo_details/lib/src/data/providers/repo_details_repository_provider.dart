import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_details/src/data/providers/repo_details_provider.dart';
import 'package:repo_details/src/data/repositories/repo_details_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo_details_repository_provider.g.dart';

@riverpod
RepoDetailsRepositoryImpl repoDetailsRepository(Ref ref) {
  return RepoDetailsRepositoryImpl(
      ref.watch(repoDetailsRemoteDataSourceProvider));
}
