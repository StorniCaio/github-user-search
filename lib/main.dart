import 'package:flutter/material.dart';
import 'package:github_user_search/repositories/history_repository.dart';
import 'package:github_user_search/services/context_service.dart';
import 'package:github_user_search/ui/controller/theme_controller.dart';
import 'package:github_user_search/ui/view/base/root_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HistoryRepository.instance.refreshHistoricFromStorage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ThemeController.instance,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: GlobalContextService.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.amber,
              useMaterial3: true,
              brightness: ThemeController.instance.darkTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            home: RootPage(),
          );
        });
  }
}
