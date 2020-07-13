import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:generify/logic/bloc/bottom_navigation_page_bloc.dart'
    as BottomNavigation;

class TrackFullScreenCard extends StatefulWidget {
  final int index;

  TrackFullScreenCard(this.index);

  @override
  _TrackFullScreenCardState createState() => _TrackFullScreenCardState();
}

class _TrackFullScreenCardState extends State<TrackFullScreenCard> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BottomNavigation.Bloc>(context);

    return Center(
      child: Container(
        child:
            Text(bloc.profileData.recentlyPlayed.toList()[widget.index].name),
      ),
    );
  }
}
