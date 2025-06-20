import 'package:core/network/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_details/src/data/data_sources/repo_details_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo_details_provider.g.dart';

@riverpod
RepoDetailsDataSource repoDetailsRemoteDataSource(Ref ref) {
  return RepoDetailsDataSource(ref.watch(dioProvider));
}
