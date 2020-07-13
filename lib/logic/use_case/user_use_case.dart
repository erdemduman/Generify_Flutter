import 'package:generify/logic/use_case/base/base_use_case.dart' as Base;
import 'package:spotify/spotify.dart';

class UseCase extends Base.UseCase {
  Future<void> executeAsync(Parameter parameter, Callback callback) async {
    execute(parameter);
    await spotify.me
        .get()
        .then((value) => callback.onUserSuccess(value))
        .catchError((error) => callback.onUserFail(error));
  }
}

class Parameter extends Base.Parameter {}

class Callback extends Base.Callback {
  void onUserSuccess(User data) {}
  void onUserFail(dynamic error) {}
}
