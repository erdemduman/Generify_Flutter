import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleBar extends StatefulWidget {
  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Image.asset('assets/generify_title.png')),
    );
  }
}
