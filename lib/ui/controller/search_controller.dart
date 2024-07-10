import 'package:flutter/material.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/models/search_result.dart';
import 'package:github_user_search/repositories/history_repository.dart';
import 'package:github_user_search/repositories/user_repository.dart';
import 'package:github_user_search/ui/controller/controller_state_enum.dart';

class SearchUserController extends ChangeNotifier {
  UserRepository userRepository = UserRepository();
  HistoryRepository historyRepository = HistoryRepository.instance;
  late SearchResult searchResult;
  ControllerState state = ControllerState.processing;

  Future<void> seachUsername(SearchModel searchModel) async {
    state = ControllerState.processing;
    var result = await userRepository.searchUser(
        searchModel.userSearched, searchModel.filter);
    if (result.status) {
      searchResult =
          SearchResult(searchModel: searchModel, users: userRepository.users);
    } else {
      SearchResult(searchModel: searchModel, users: []);
    }
    state = ControllerState.fininhed;
    historyRepository.saveToHistoric(
        searchUsername: searchModel.userSearched,
        filter: searchModel.filter,
        foundedUsers: searchResult.users.length);
    notifyListeners();
  }
}
