import 'package:flutter_test/flutter_test.dart';
import 'package:github_user_search/repositories/user_repository.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';

void main() {
  UserRepository userRepository = UserRepository();
  test('user repository ...', () async {
    var result = await userRepository.searchUser("stornicaio");
    print(userRepository.users);
    assert(result.status && userRepository.users.length == 1);
  });

  test('user repository ...', () async {
    var result = await userRepository.searchUser(
        "ra", UserFilterModel(location: "brasil"));
    print(userRepository.users);
    assert(result.status && userRepository.users.length > 1);
  });
}
