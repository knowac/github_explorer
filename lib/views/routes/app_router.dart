import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_explorer/core/constants/route_names.dart';
import 'package:github_explorer/views/widgets/main_scaffold.dart';
import 'package:github_explorer/views/screens/repository_details_screen.dart';
import 'package:github_explorer/views/screens/search_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../screens/error_screen.dart';

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
