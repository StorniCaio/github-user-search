import 'package:flutter/material.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/ui/view/base/root_page.dart';
import 'package:github_user_search/ui/view/history_page.dart';
import 'package:github_user_search/ui/view/search_page.dart';
import 'package:github_user_search/ui/view/search_result_page.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorSearchKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
final _shellNavigatorHistoryKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHistory');

final goRouter = GoRouter(
  initialLocation: '/search',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return RootPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSearchKey,
          routes: [
            GoRoute(
              path: '/search',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SearchPage(
                  searchResultPath: "/search/user",
                ),
              ),
              routes: [
                GoRoute(
                  path: 'user',
                  builder: (context, state) => SearchResultPage(
                    searchModel: (state.extra as SearchModel),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHistoryKey,
          routes: [
            GoRoute(
              path: '/history',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HistoryPage(searchResultPath: "/search/user"),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
