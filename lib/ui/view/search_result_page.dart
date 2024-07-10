import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/repositories/history_repository.dart';
import 'package:github_user_search/ui/view/base/base_page.dart';
import 'package:github_user_search/ui/controller/controller_state_enum.dart';
import 'package:github_user_search/ui/controller/search_controller.dart';
import 'package:provider/provider.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key, required this.searchModel});
  final SearchModel searchModel;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        title: AppLabels.searchResulTitle(widget.searchModel.userSearched),
        body: Center(
          child: ChangeNotifierProvider<SearchUserController>(
            create: (context) =>
                SearchUserController()..seachUsername(widget.searchModel),
            child: Consumer<SearchUserController>(
              builder: (context, controller, child) {
                if (controller.state == ControllerState.processing) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var users = controller.searchResult.users;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Text(users.elementAt(index).login);
                    });
              },
            ),
          ),
        ));
  }
}
