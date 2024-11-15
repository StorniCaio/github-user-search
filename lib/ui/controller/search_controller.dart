import 'package:flutter/material.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/models/search_result.dart';
import 'package:github_user_search/provider/storage_provider.dart';
import 'package:github_user_search/repositories/user_repository.dart';
import 'package:github_user_search/ui/controller/controller_state_enum.dart';

class SearchUserController extends ChangeNotifier {
  final IUserRepository userRepository;
  StorageProvider historyRepository = StorageProvider.instance;
  late SearchResult searchResult;
  ControllerState state = ControllerState.processing;

  SearchUserController({required this.userRepository});

  Future<void> seachUsername(SearchModel searchModel) async {
    state = ControllerState.processing;
    var result = await userRepository.searchUser(
        searchModel.userSearched, searchModel.filter);
    if (result.status) {
      searchResult =
          SearchResult(searchModel: searchModel, users: userRepository.users);
    } else {
      state = ControllerState.error;
      SearchResult(searchModel: searchModel, users: []);
    }
    state = ControllerState.finished;
    historyRepository.saveToHistoric(
        searchUsername: searchModel.userSearched,
        filter: searchModel.filter,
        foundedUsers: searchResult.users.length);
    notifyListeners();
  }
}
