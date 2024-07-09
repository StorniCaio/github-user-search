import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/ui/view/base/base_page.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key, required this.searchModel});
  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: AppLabels.searchResulTitle(searchModel.userSearched),
        body: const Center(
          child: Text("Search Result"),
        ));
  }
}
