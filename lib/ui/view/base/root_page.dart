import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            label: AppLabels.searchButton,
            icon: const Icon(Icons.search),
          ),
          NavigationDestination(
            label: AppLabels.historyButton,
            icon: const Icon(Icons.history),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
