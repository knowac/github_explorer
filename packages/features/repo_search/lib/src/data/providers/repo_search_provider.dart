import 'package:repo_search/src/data/data_sources/repo_search_data_source.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:core/network/dio_provider.dart';

part 'repo_search_provider.g.dart';

@riverpod
RepoSearchDataSource repoSearchRemoteDataSource(Ref ref) {
  return RepoSearchDataSource(ref.watch(dioProvider));
}
