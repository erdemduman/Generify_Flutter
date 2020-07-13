import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generify/constants/my_colors.dart';
import 'package:generify/utils/dominant_color.dart';
import 'package:provider/provider.dart';
import 'package:generify/logic/bloc/bottom_navigation_page_bloc.dart'
    as BottomNavigation;

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BottomNavigation.Bloc>(context);

    return Container(
      height: 230,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
              bottomLeft: const Radius.circular(40.0),
              bottomRight: const Radius.circular(40.0)),
          color: bloc.avatarBackgroundColor.withOpacity(0.25)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage(bloc.profileData.user.images[0].url),
            ),
            SizedBox(height: 10),
            Text(
              bloc.profileData.user.displayName,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
