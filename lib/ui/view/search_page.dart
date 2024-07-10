import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/models/search_result.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';
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
  String _location = "";
  String _language = "";
  String _repo = "";
  String _follower = "";
  bool showFilter = false;

  void searchUser() {
    if (_username.isNotEmpty) {
      var filter = UserFilterModel(
          location: _location.isNotEmpty ? _location : null,
          language: _language.isNotEmpty ? _language : null,
          followers: _follower.isNotEmpty ? int.parse(_follower) : null,
          repos: _repo.isNotEmpty ? int.parse(_repo) : null);

      searchModel = SearchModel(userSearched: _username, filter: filter);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchResultPage(
                    searchModel: searchModel,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: AppLabels.searchPageTitle,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: AppLabels.searchLabel,
                      hintText: AppLabels.searchLabel,
                      prefixIcon: const Icon(Icons.account_circle),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                  onChanged: (value) {
                    _username = value;
                  },
                ),
              ),
              showFilter ? filter() : const SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          searchUser();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.search),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLabels.searchbutton,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showFilter = !showFilter;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.filter_alt),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLabels.filterButtom,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      )),
                ],
              )
            ],
          ),
        ));
  }

  filter() {
    TextEditingController locationController = TextEditingController();
    TextEditingController languagegController = TextEditingController();
    TextEditingController followerController = TextEditingController();
    TextEditingController repoController = TextEditingController();

    double verticalPdd = 5;
    double horizPdd = 10;
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(vertical: verticalPdd, horizontal: horizPdd),
          child: TextField(
            controller: locationController,
            decoration: InputDecoration(
                labelText: AppLabels.location,
                hintText: AppLabels.location,
                prefixIcon: const Icon(Icons.location_on),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            onChanged: (value) {
              print(value);
              _location = value;
            },
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(vertical: verticalPdd, horizontal: horizPdd),
          child: TextField(
            controller: languagegController,
            decoration: InputDecoration(
                labelText: AppLabels.languageText,
                hintText: AppLabels.languageText,
                prefixIcon: const Icon(Icons.language),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            onChanged: (value) {
              print(value);
              _language = value;
            },
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(vertical: verticalPdd, horizontal: horizPdd),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: followerController,
            decoration: InputDecoration(
                labelText: AppLabels.followers,
                hintText: AppLabels.followers,
                prefixIcon: const Icon(Icons.numbers),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            onChanged: (value) {
              print(value);
              _follower = value;
            },
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(vertical: verticalPdd, horizontal: horizPdd),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: repoController,
            decoration: InputDecoration(
                labelText: AppLabels.repoText,
                hintText: AppLabels.repoText,
                prefixIcon: const Icon(Icons.folder),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            onChanged: (value) {
              print(value);
              _repo = value;
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                locationController.clear();
                languagegController.clear();
                followerController.clear();
                repoController.clear();
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.clear),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLabels.clearFilter,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
