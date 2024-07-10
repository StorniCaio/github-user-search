import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/models/history_model.dart';
import 'package:github_user_search/models/search_model.dart';
import 'package:github_user_search/repositories/history_repository.dart';
import 'package:github_user_search/ui/view/base/base_page.dart';
import 'package:github_user_search/ui/view/search_result_page.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryRepository historyRepository = HistoryRepository.instance;
  @override
  Widget build(BuildContext context) {
    var history = historyRepository.history;
    return BasePage(
        title: AppLabels.historyPageTitle,
        body: history.isEmpty
            ? noHistory()
            : ListView.builder(
                itemCount: history.length,
                itemBuilder: (BuildContext context, int index) {
                  //index for decreasing order
                  var i = history.length - 1 - index;
                  return element(history, i);
                }));
  }

  element(List<HistoryModel> history, int i) {
    bool hasFilter = history.elementAt(i).filter?.followers != null ||
        history.elementAt(i).filter?.language != null ||
        history.elementAt(i).filter?.location != null ||
        history.elementAt(i).filter?.repos != null;

    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      "${history.elementAt(i).usernameSearched ?? ""}${hasFilter ? " (${AppLabels.fitered})" : ""}"),
                  subtitle: Text(DateFormat("yyyy-MM-dd HH:mm:ss")
                      .format(history.elementAt(i).datetime)),
                  trailing: IconButton(
                      onPressed: () {
                        var searchModel = SearchModel(
                            userSearched:
                                history.elementAt(i).usernameSearched ?? "",
                            filter: history.elementAt(i).filter);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResultPage(
                                      searchModel: searchModel,
                                    ))).then((_) {
                          setState(() {});
                        });
                      },
                      icon: const Icon(Icons.search)),
                ),
              ],
            ),
          ),
        ));
  }

  noHistory() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    AppLabels.noHistory,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
