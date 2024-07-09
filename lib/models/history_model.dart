import 'package:github_user_search/services/model/user_filter_model.dart';

class HistoryModel {
  String? usernameSearched;
  DateTime datetime = DateTime.now();
  int? foundedUsers;
  UserFilterModel? filter;

  HistoryModel({this.usernameSearched, this.foundedUsers, this.filter});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    usernameSearched = json['usernameSearched'];
    datetime = DateTime.parse(json['datetime']);
    foundedUsers = json['foundedUsers'];
    filter = json["filter"] != null
        ? UserFilterModel.fromJson(json["filter"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['usernameSearched'] = usernameSearched;
    data['datetime'] = datetime.toUtc().toString();
    data['foundedUsers'] = foundedUsers;
    data['filter'] = filter?.toJson();
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
