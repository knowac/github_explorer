import 'package:github_explorer/services/github_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final githubServiceProvider = Provider<GithubService>((ref) {
  return GithubService();
});
