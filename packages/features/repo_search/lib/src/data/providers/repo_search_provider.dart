import 'package:core/network/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_search/src/data/data_sources/repo_search_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo_search_provider.g.dart';

@riverpod
RepoSearchDataSource repoSearchRemoteDataSource(Ref ref) {
  return RepoSearchDataSource(ref.watch(dioProvider));
}
