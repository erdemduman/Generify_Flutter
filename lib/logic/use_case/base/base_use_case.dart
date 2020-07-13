import 'package:spotify/spotify.dart';

class UseCase {
  SpotifyApi spotify;

  void execute(Parameter data) {
    this.spotify = data.spotify;
  }
}

class Parameter {
  SpotifyApi spotify;
}

class Callback {}
