import 'package:flutter/foundation.dart';
import 'package:github_user_search/models/user_model.dart';
import 'package:github_user_search/services/github_client_service.dart';
import 'package:github_user_search/services/model/result_model.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';

abstract class IUserRepository {
  late List<UserModel> users;

  Future<Result> searchUser(String username, [UserFilterModel? filter]);
}

class UserRepository implements IUserRepository {
  @override
  late List<UserModel> users;
  final IGitHubClientService githubService;

  UserRepository({required this.githubService});

  @override
  Future<Result> searchUser(String username, [UserFilterModel? filter]) async {
    debugPrint("state: repository");
    Result result = Result(status: false);

    final response = await githubService.searchUsername(username, filter);
    if (response.body.isNotEmpty) {
      users = (response.body['items'] as List)
          .map((x) => UserModel.fromJson(x))
          .toList();
      result.status = true;
      return result;
    }
    return result;
  }
}
