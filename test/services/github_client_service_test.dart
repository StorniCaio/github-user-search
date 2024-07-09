import 'package:flutter_test/flutter_test.dart';
import 'package:github_user_search/services/github_client_service.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';

void main() {
  var githubclient = GitHubClientService();

  test('Testing github client service - without query parameters...', () async {
    var result = await githubclient.genericHttpGet(path: "users/stornicaio");
    assert(result.status &&
        result.code == 200 &&
        result.body.containsKey('login'));
  });

  test('Testing github client service - with query parameters...', () async {
    var result = await githubclient.genericHttpGet(
        path: "search/users", queryParameters: {'q': "stornicaio"});

    print(result.body);

    assert(result.status &&
        result.code == 200 &&
        result.body.containsKey('items') &&
        (result.body['items'] as List).any((x) => x['login'] == 'StorniCaio'));
  });

  test('Testing github client service - search username ', () async {
    var result = await githubclient.searchUsername("qwe");
    print(result.body);
    assert(result.status && (result.body['total_count'] as int) > 0);
  });

  test('Testing github client service - search username filtering ', () async {
    var result = githubclient.getQueryParameters(
        "qwe",
        UserFilterModel(
            language: "go", location: "Russia", repos: 10, followers: 5));
    print(result);
    assert(result.toString() ==
        "{q: qwe language:go location:Russia repos:10 followers:5}");
  });
}
