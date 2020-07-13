import 'package:generify/logic/use_case/base/base_use_case.dart' as Base;
import 'package:spotify/spotify.dart';

class UseCase extends Base.UseCase {
  Future<void> executeAsync(Parameter parameter, Callback callback) async {
    execute(parameter);
    await spotify.me
        .recentlyPlayed()
        .then((value) => callback.onRecentlyPlayedSuccess(value))
        .catchError((error) => callback.onRecentlyPlayedFail(error));
  }
}

class Parameter extends Base.Parameter {}

class Callback extends Base.Callback {
  void onRecentlyPlayedSuccess(Iterable<Track> data) {}
  void onRecentlyPlayedFail(dynamic error) {}
}
