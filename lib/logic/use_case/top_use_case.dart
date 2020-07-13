import 'package:generify/logic/use_case/base/base_use_case.dart' as Base;
import 'package:spotify/spotify.dart';

class UseCase extends Base.UseCase {
  Future<void> executeAsync(Parameter parameter, Callback callback) async {
    execute(parameter);
    await spotify.me
        .topTracks()
        .then((value) => callback.onTopSuccess(value))
        .catchError((error) => callback.onTopFail(error));
  }
}

class Parameter extends Base.Parameter {}

class Callback extends Base.Callback {
  void onTopSuccess(Iterable<Track> data) {}
  void onTopFail(dynamic error) {}
}
