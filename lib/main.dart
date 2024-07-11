import 'package:flutter/material.dart';
import 'package:github_user_search/repositories/history_repository.dart';
import 'package:github_user_search/repositories/user_repository.dart';
import 'package:github_user_search/routes/routes.dart';
import 'package:github_user_search/services/github_client_service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HistoryRepository.instance.refreshHistoricFromStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IGitHubClientService>(create: (_) => GitHubClientService()),
        Provider<IUserRepository>(
          create: (context) => UserRepository(
              githubService:
                  Provider.of<IGitHubClientService>(context, listen: false)),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.amber,
              useMaterial3: true,
              brightness: Brightness.dark),
          onGenerateRoute: (settings) =>
              RouteGenerator.generateRoute(settings)),
    );
  }
}
