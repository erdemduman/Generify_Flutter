import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generify/ui/page/slide_page/recently_played_slide_page.dart';
import 'package:generify/ui/page/slide_page/top_tracks_slide_page.dart';
import 'package:generify/ui/page/slide_page/user_slide_page.dart';
import 'package:generify/ui/view/loading_view.dart';
import 'package:provider/provider.dart';
import 'package:generify/logic/bloc/bottom_navigation_page_bloc.dart'
    as BottomNavigation;

class ProfileTabPage extends StatefulWidget {
  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BottomNavigation.Bloc>(context);
    return bodySelection(bloc);
  }

  Widget bodySelection(BottomNavigation.Bloc bloc) {
    return bloc.isLoading == true ? loadingView() : page(bloc);
  }

  Widget page(BottomNavigation.Bloc bloc) {
    return RefreshIndicator(
      onRefresh: bloc.pullToRefresh,
      child: PageView(
        children: <Widget>[
          UserSlidePage(),
          RecentlyPlayedSlidePage(),
          TopTracksSlidePage()
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
