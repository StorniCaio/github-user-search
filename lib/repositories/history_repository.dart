import 'package:github_user_search/models/history_model.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HistoryRepository {
  List<HistoryModel> history = [];

  static HistoryRepository instance = HistoryRepository();

  Future<void> refreshHistoricFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? string = "${prefs.getString("history")}";

    try {
      Iterable l = jsonDecode(string);
      history = List<HistoryModel>.from(
        l.map(
          (model) => HistoryModel.fromJson(model),
        ),
      );
    } catch (e) {
      print(e);
      history = [];
    }
  }

  saveToHistoric(
      {required String searchUsername,
      int? foundedUsers,
      UserFilterModel? filter}) async {
    await refreshHistoricFromStorage();
    history.add(HistoryModel(
        usernameSearched: searchUsername,
        filter: filter,
        foundedUsers: foundedUsers));
    await _saveToStorage();
  }

  Future<void> _saveToStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("history", jsonEncode(history));
    await refreshHistoricFromStorage();
  }
}
