import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:generify/constants/my_colors.dart';
import 'package:generify/ui/page/tab_page/home_tab_page.dart';
import 'package:generify/ui/page/tab_page/notifications_tab_page.dart';
import 'package:generify/ui/page/tab_page/playlist_tab_page.dart';
import 'package:generify/ui/page/tab_page/profile_tab_page.dart';
import 'package:generify/ui/view/title_bar.dart';
import 'package:provider/provider.dart';
import 'package:generify/logic/bloc/bottom_navigation_page_bloc.dart'
    as BottomNavigation;

Object _args;

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage(Object args) {
    _args = args;
  }
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BottomNavigation.Bloc(), child: PageBody());
  }
}

class PageBody extends StatefulWidget {
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BottomNavigation.Bloc>(context);
    bloc.onCreate(arguments: _args);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: getTabPage(bloc.currentTab),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: bloc.barItems,
        circleColor: MyColors.mainTheme,
        activeIconColor: Colors.white,
        barBackgroundColor: Colors.white,
        textColor: MyColors.mainTheme,
        inactiveIconColor: MyColors.mainTheme,
        onTabChangedListener: (value) => bloc.onTabSelected(value),
        initialSelection: bloc.currentTab,
      ),
    );
  }

  Widget getTabPage(int tab) {
    Widget option;
    switch (tab) {
      case 0:
        option = HomeTabPage();
        break;
      case 1:
        option = PlaylistTabPage();
        break;
      case 2:
        option = NotificationsTabPage();
        break;
      case 3:
        option = ProfileTabPage();
        break;
      default:
    }
    return option;
  }
}
