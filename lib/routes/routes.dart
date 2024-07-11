import 'package:flutter/material.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/ui/view/base/root_page.dart';
import 'package:github_user_search/ui/view/search/search_result_page.dart';

class RouteGenerator {
  static const String root = '/';
  static const String result = 'result';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (RouteGenerator.result):
        return MaterialPageRoute(
            builder: (_) => SearchResultPage(
                searchModel: settings.arguments as SearchModel));
      case (RouteGenerator.root):
      default:
        return MaterialPageRoute(builder: (_) => const RootPage());
    }
  }
}
