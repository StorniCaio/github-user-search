import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_user_search/services/model/result_model.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';

abstract class IGitHubClientService {
  Future<Result> genericHttpGet(
      {required String path, Map<String, String>? queryParameters});
  Future<Result> searchUsername(String username, [UserFilterModel? filter]);
}

class GitHubClientService implements IGitHubClientService {
  Dio dio = Dio();
  static String baseEndpoint = "api.github.com";

  @override
  Future<Result> genericHttpGet(
      {required String path, Map<String, String>? queryParameters}) async {
    debugPrint("state: services");

    dio.options.headers["Accept-type"] = "application/vnd.github+json";
    dio.options.headers["X-GitHub-Api-Version"] = "2022-11-28";

    try {
      final response = await dio.get('https://api.github.com/$path',
          queryParameters: queryParameters ?? {});
      return Result(
          status: response.statusCode == 200 ? true : false,
          code: response.statusCode,
          body: response.data);
    } on DioException catch (e) {
      return Result(status: false, code: e.response?.statusCode);
    }
  }

  @override
  Future<Result> searchUsername(String username,
      [UserFilterModel? filter]) async {
    return await genericHttpGet(
        path: "search/users",
        queryParameters: getQueryParameters(username, filter));
  }

  Map<String, String> getQueryParameters(String username,
      [UserFilterModel? filter]) {
    Map<String, String> m = {'q': username};
    if (filter != null) {
      m['q'] = "${m['q']}"
          "${filter.language != null ? " language:${filter.language}" : ""}";
      m['q'] = "${m['q']}"
          "${filter.location != null ? " location:${filter.location}" : ""}";
      m['q'] = "${m['q']}"
          "${filter.repos != null ? " repos:${filter.repos}" : ""}";
      m['q'] = "${m['q']}"
          "${filter.followers != null ? " followers:${filter.followers}" : ""}";
    }
    return m;
  }
}
