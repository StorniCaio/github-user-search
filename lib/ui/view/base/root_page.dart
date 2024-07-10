import 'package:flutter/material.dart';
import 'package:github_user_search/labels/app_labels.dart';
import 'package:github_user_search/ui/view/history/history_page.dart';
import 'package:github_user_search/ui/view/search/search_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key, this.initPage = 0});
  final int initPage;

  @override
  State<RootPage> createState() => _HomePageState();
}

class _HomePageState extends State<RootPage> {
  int actualPageIndex = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: widget.initPage);
  }

  void navigate(int index) {
    setState(() {
      pc.animateToPage(index,
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
      actualPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pc,
        children: const [SearchPage(), HistoryPage()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: actualPageIndex,
        destinations: const [
          NavigationDestination(
            label: AppLabels.searchButton,
            icon: Icon(Icons.search),
          ),
          NavigationDestination(
            label: AppLabels.historyButton,
            icon: Icon(Icons.history),
          ),
        ],
        onDestinationSelected: navigate,
      ),
    );
  }
}
