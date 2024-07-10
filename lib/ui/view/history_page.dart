import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/repositories/history_repository.dart';
import 'package:github_user_search/ui/view/base/base_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryRepository historyRepository = HistoryRepository.instance;
  @override
  Widget build(BuildContext context) {
    var history = historyRepository.history;
    return BasePage(
        title: AppLabels.historyPageTitle,
        body: ListView.builder(
            itemCount: history.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(history.elementAt(index).usernameSearched ?? "");
            }));
  }
}
