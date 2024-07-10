import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';

enum ButtonType {
  search(icon: Icon(Icons.search), text: AppLabels.searchButton),
  filter(icon: Icon(Icons.filter_alt), text: AppLabels.filterButtom),
  clearFilter(icon: Icon(Icons.clear), text: AppLabels.clearFilter);

  final Icon icon;
  final String text;

  const ButtonType({required this.icon, required this.text});
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.onPress, required this.buttonType});
  final ButtonType buttonType;

  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          onPressed: () {
            onPress.call();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buttonType.icon,
              const SizedBox(
                width: 10,
              ),
              Text(
                buttonType.text,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
