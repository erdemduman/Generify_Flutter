import 'package:flutter/cupertino.dart';
import 'package:spotify/spotify.dart';

class Bloc extends ChangeNotifier {
  void onCreate({Object arguments = null}) {}

  void onDestroy() {}
}

class Parameter {
  SpotifyApi spotify;
}
