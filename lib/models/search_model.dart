import 'package:github_user_search/services/model/user_filter_model.dart';

class SearchModel {
  String userSearched;
  UserFilterModel? filter;
  SearchModel({required this.userSearched, this.filter});
}
