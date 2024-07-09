import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/models/user_model.dart';

class SearchResult {
  SearchModel searchModel;
  List<UserModel> users;

  SearchResult({required this.searchModel, required this.users});
}
