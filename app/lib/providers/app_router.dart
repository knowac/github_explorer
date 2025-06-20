import 'package:core/constants/route_names.dart';
import 'package:display_errors/display_error_export.dart';
import 'package:display_main_scaffold/display_main_scaffold_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:repo_details/repo_details_export.dart';
import 'package:repo_search/repo_search_export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey();

@riverpod
GoRouter route(Ref ref) {
  return GoRouter(
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: ErrorScreen(error: state.error),
      );
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: RouteNames.home,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: SearchScreen(),
              );
            },
          ),
          GoRoute(
            path: '/repository/:owner/:name',
            builder: (context, state) {
              final owner = state.pathParameters['owner'];
              final name = state.pathParameters['name'];
              return RepositoryDetailsScreen(
                owner: owner,
                name: name,
              );
            },
          ),
        ],
      ),
    ],
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      if (state.error != null) {
        return '/';
      }
      return null;
    },
  );
}
