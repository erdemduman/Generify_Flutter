import 'package:flutter/widgets.dart';
import 'package:generify/ui/view/track_fullscreen_card.dart';
import 'package:provider/provider.dart';
import 'package:generify/logic/bloc/bottom_navigation_page_bloc.dart'
    as BottomNavigation;

class RecentlyPlayedSlidePage extends StatefulWidget {
  @override
  _RecentlyPlayedSlidePageState createState() =>
      _RecentlyPlayedSlidePageState();
}

class _RecentlyPlayedSlidePageState extends State<RecentlyPlayedSlidePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BottomNavigation.Bloc>(context);

    return Container(
      child: Center(
        child: PageView.builder(
          itemBuilder: (context, index) {
            return TrackFullScreenCard(index);
          },
          itemCount: bloc.profileData.recentlyPlayed.toList().length,
        ),
      ),
    );
  }
}
