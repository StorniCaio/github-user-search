import 'package:flutter/material.dart';
import 'package:github_user_search/services/model/user_filter_model.dart';
import 'package:github_user_search/ui/widgets/button_widget.dart';
import 'package:github_user_search/ui/widgets/text_field_widget.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key, required this.updateFilter});

  final Function(UserFilterModel) updateFilter;

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  UserFilterModel searchFilter = UserFilterModel();
  bool hasFilter = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    TextEditingController languagegController = TextEditingController();
    TextEditingController followerController = TextEditingController();
    TextEditingController repoController = TextEditingController();

    return Column(
      children: [
        TextFieldWidget(
          filterTextType: TextFieldType.location,
          controller: locationController,
          onTextChange: (value) {
            searchFilter.location = value.isNotEmpty ? value : null;
            widget.updateFilter.call(searchFilter);
          },
        ),
        TextFieldWidget(
          filterTextType: TextFieldType.language,
          controller: languagegController,
          onTextChange: (value) {
            searchFilter.language = value.isNotEmpty ? value : null;
            widget.updateFilter.call(searchFilter);
          },
        ),
        TextFieldWidget(
          textInputType: TextInputType.number,
          filterTextType: TextFieldType.followers,
          controller: followerController,
          onTextChange: (value) {
            searchFilter.followers = value.isNotEmpty ? int.parse(value) : null;
            widget.updateFilter.call(searchFilter);
          },
        ),
        TextFieldWidget(
          textInputType: TextInputType.number,
          filterTextType: TextFieldType.repo,
          controller: repoController,
          onTextChange: (value) {
            searchFilter.repos = value.isNotEmpty ? int.parse(value) : null;
            widget.updateFilter.call(searchFilter);
          },
        ),
        ButtonWidget(
            onPress: () {
              setState(() {
                locationController.clear();
                languagegController.clear();
                followerController.clear();
                repoController.clear();
                searchFilter = UserFilterModel();
              });
            },
            buttonType: ButtonType.clearFilter),
      ],
    );
  }
}
