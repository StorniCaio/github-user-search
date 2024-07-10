import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';
import 'package:github_user_search/ui/view/base/base_page.dart';
import 'package:github_user_search/ui/view/search/filter_component.dart';
import 'package:github_user_search/ui/widgets/button_widget.dart';
import 'package:github_user_search/ui/widgets/text_field_widget.dart';
import 'package:github_user_search/ui/view/search/search_result_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel = SearchModel(userSearched: "testing...");
  UserFilterModel searchFilter = UserFilterModel();
  String _username = "";
  bool showFilter = false;

  void searchUser() {
    if (_username.isNotEmpty) {
      searchModel = SearchModel(
          userSearched: _username,
          filter: searchFilter.hasFilter() ? searchFilter : null);

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
              TextFieldWidget(
                filterTextType: TextFieldType.search,
                onTextChange: (value) {
                  _username = value;
                },
              ),
              showFilter
                  ? FilterComponent(
                      updateFilter: (userFilterModel) {
                        searchFilter = userFilterModel;
                      },
                    )
                  : const SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonWidget(
                      onPress: () {
                        searchUser();
                      },
                      buttonType: ButtonType.search),
                  ButtonWidget(
                      onPress: () {
                        setState(() {
                          showFilter = !showFilter;
                        });
                      },
                      buttonType: ButtonType.filter)
                ],
              )
            ],
          ),
        ));
  }
}
