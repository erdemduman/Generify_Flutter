import 'package:spotify/spotify.dart';

abstract class Module {
  SpotifyApi spotify;

  Future<void> executeFlow(Parameter parameter, Callback callback) {}
}

class Parameter {
  SpotifyApi spotify;
}

class Callback {}
