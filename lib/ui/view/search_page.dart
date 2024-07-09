import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/ui/view/base/base_page.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.searchResultPath});
  final String searchResultPath;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel = SearchModel(userSearched: "testing...");

  void searchUser() {
    context.go("/search/user", extra: searchModel);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: AppLabels.searchPageTitle,
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    searchUser();
                  },
                  child: const Text("Go Search Result Page"))
            ],
          ),
        ));
  }
}
