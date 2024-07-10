import 'package:flutter/material.dart';
import 'package:github_user_search/ui/controller/theme_controller.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key, required this.title, required this.body});
  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ThemeController.instance.darkTheme
              ? Colors.black54
              : Colors.blueGrey,
        ),
        body: body);
  }
}
