import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/models/search_result.dart';
import 'package:github_user_search/ui/view/base/base_page.dart';
import 'package:github_user_search/ui/view/search_result_page.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel = SearchModel(userSearched: "testing...");
  String _username = "";

  void searchUser() {
    searchModel = SearchModel(userSearched: _username);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchResultPage(
                  searchModel: searchModel,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: AppLabels.searchPageTitle,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  print(value);
                  _username = value;
                },
              ),
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
