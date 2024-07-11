import 'package:flutter/material.dart';

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
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black54,
        ),
        body: body);
  }
}
