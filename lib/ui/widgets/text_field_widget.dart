import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';

enum TextFieldType {
  language(icon: Icon(Icons.language), textLabel: AppLabels.languageText),
  location(icon: Icon(Icons.location_on), textLabel: AppLabels.location),
  followers(icon: Icon(Icons.numbers), textLabel: AppLabels.followers),
  repo(icon: Icon(Icons.folder), textLabel: AppLabels.repoText),
  search(
      icon: Icon(Icons.account_circle),
      textLabel: AppLabels.searchLabel,
      padding: EdgeInsets.all(10));

  final Icon icon;
  final String textLabel;
  final EdgeInsetsGeometry padding;
  const TextFieldType(
      {required this.textLabel,
      required this.icon,
      this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10)});
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.onTextChange,
      required this.filterTextType,
      this.controller,
      this.textInputType});

  final Function(String) onTextChange;
  final TextFieldType filterTextType;

  final TextEditingController? controller;
  final TextInputType? textInputType;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.filterTextType.padding,
      child: TextField(
        keyboardType: widget.textInputType,
        controller: widget.controller,
        decoration: InputDecoration(
            labelText: widget.filterTextType.textLabel,
            hintText: widget.filterTextType.textLabel,
            prefixIcon: widget.filterTextType.icon,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        onChanged: (value) => widget.onTextChange.call(value),
      ),
    );
  }
}
