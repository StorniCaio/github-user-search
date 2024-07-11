import 'package:flutter_test/flutter_test.dart';
import 'package:github_user_search/repositories/user_repository.dart';
import 'package:github_user_search/services/github_client_service.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';

void main() {
  GitHubClientService githuhClientService = GitHubClientService();
  UserRepository userRepository =
      UserRepository(githubService: githuhClientService);
  test('user repository ...', () async {
    var result = await userRepository.searchUser("stornicaio");
    assert(result.status && userRepository.users.length == 1);
  });

  test('user repository ...', () async {
    var result = await userRepository.searchUser(
        "ra", UserFilterModel(location: "brasil"));
    assert(result.status && userRepository.users.length > 1);
  });
}
