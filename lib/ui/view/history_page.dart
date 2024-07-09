import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/ui/view/base/base_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key, required this.searchResultPath});
  final String searchResultPath;

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: AppLabels.historyPageTitle,
        body: const Center(child: Text("History Page")));
  }
}
