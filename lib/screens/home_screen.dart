import 'package:flutter/material.dart';
import 'package:system_task/screens/cards_screen.dart';
import 'package:system_task/screens/transaction_summary_screen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedMenuItem = 0;
  late List<Widget> allPages;
  var keyHomePage = const PageStorageKey("key_home_page");
  var keySearchPage = const PageStorageKey("key_search_page");
final bottomTabItems = [
              const BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
              const BottomNavigationBarItem(icon: Icon(Icons.wallet_membership_outlined), label: ''),
              const BottomNavigationBarItem(icon: Icon(Icons.replay), label: ''),
              const BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: ''),
            ];
  @override
  void initState() {
    allPages = [ CardsScreen(),TransactionSummaryScreen(),CardsScreen(), TransactionSummaryScreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: selectedMenuItem <= allPages.length - 1
            ? allPages[selectedMenuItem]
            : allPages[0],
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  Widget get bottomNavigationBar {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            items: bottomTabItems
      ,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedMenuItem,
        onTap: (index){
          setState(() {
            selectedMenuItem=index;
          });
        },
        unselectedItemColor: const Color(0xFF4D5C74),
        backgroundColor: const Color(0xFF021D41),
        selectedItemColor: const Color(0xFF3267A7),
        showUnselectedLabels: true,
      ),
    );
  }

}