import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_user_search/models/history_model.dart';
import 'package:github_user_search/repositories/history_repository.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HistoryRepository historyRepository = HistoryRepository.instance;
  SharedPreferences.setMockInitialValues({
    "history": '''[{"usernameSearched":"searchUsername",
      "datetime":"2024-07-09 13:30:07.960057Z",
      "foundedUsers":null,"filter":null},
      {"usernameSearched":"searchUsername",
      "datetime":"2024-07-09 13:30:07.965757Z",
      "foundedUsers":null,"filter":null}]'''
  });
  await historyRepository.refreshHistoricFromStorage();

  test('history repository - chached history', () async {
    print(historyRepository.history);
    var counter = 0;
    for (HistoryModel h in historyRepository.history) {
      counter = h.usernameSearched == "searchUsername" ? counter + 1 : counter;
    }
    assert(counter == 2);
  });

  test("history repository - saving history", () async {
    var username = "username123";
    await historyRepository.saveToHistoric(
        searchUsername: username,
        filter: UserFilterModel(
            followers: 10, language: "PT", repos: 2, location: "BR"));
    print(historyRepository.history);

    assert(historyRepository.history.any((h) =>
        h.usernameSearched == username &&
        h.filter?.followers == 10 &&
        h.filter?.repos == 2 &&
        h.filter?.location == "BR" &&
        h.filter?.language == "PT"));
    assert(historyRepository.history.length == 3);
  });
}
