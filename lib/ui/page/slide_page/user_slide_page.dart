import 'package:flutter/widgets.dart';
import 'package:generify/ui/view/profile_card.dart';

class UserSlidePage extends StatefulWidget {
  @override
  _UserSlidePageState createState() => _UserSlidePageState();
}

class _UserSlidePageState extends State<UserSlidePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            ProfileCard(),
          ],
        )
      ],
    ));
  }
}
