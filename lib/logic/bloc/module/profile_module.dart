import 'package:generify/logic/bloc/module/base/base_module.dart' as Base;
import 'package:generify/model/profile_model.dart';
import 'package:generify/utils/flow.dart';
import 'package:spotify/src/models/_models.dart';
import 'package:generify/logic/use_case/user_use_case.dart' as UserLogic;
import 'package:generify/logic/use_case/top_use_case.dart' as TopLogic;
import 'package:generify/logic/use_case/recently_played_use_case.dart'
    as RecentlyPlayedLogic;

class Module extends Base.Module
    implements
        UserLogic.Callback,
        TopLogic.Callback,
        RecentlyPlayedLogic.Callback {
  Flow _flow;
  UserLogic.UseCase _userUseCase;
  TopLogic.UseCase _topUseCase;
  RecentlyPlayedLogic.UseCase _recentlyPlayedUseCase;
  User _userInfo;
  Iterable<Track> _topTracks;
  Iterable<Track> _recentlyPlayed;
  ProfileModel _profileModel;
  Callback _callback;

  Module() {
    _userUseCase = UserLogic.UseCase();
    _topUseCase = TopLogic.UseCase();
    _recentlyPlayedUseCase = RecentlyPlayedLogic.UseCase();
  }

  @override
  Future<void> executeFlow(Base.Parameter parameter, Base.Callback callback) {
    var param = parameter as Parameter;
    _callback = callback as Callback;
    this.spotify = param.spotify;
    _flow = Flow([
      FlowUnit()..task = _getUserInfo,
      FlowUnit()..task = _getRecentlyPlayed,
      FlowUnit()..task = _getTopTracks,
      FlowUnit()..task = _createProfileModel
    ]);
    _flow.start();
  }

  void _getUserInfo() async {
    await _userUseCase.executeAsync(
        UserLogic.Parameter()..spotify = spotify, this);
  }

  @override
  void onUserSuccess(User data) {
    _userInfo = data;
    _flow.next();
  }

  @override
  void onUserFail(error) {
    _flow.fail();
    _callback.onProfileModuleFail(error);
  }

  void _getRecentlyPlayed() async {
    await _recentlyPlayedUseCase.executeAsync(
        RecentlyPlayedLogic.Parameter()..spotify = spotify, this);
  }

  @override
  void onRecentlyPlayedSuccess(Iterable<Track> data) {
    _recentlyPlayed = data;
    _flow.next();
  }

  @override
  void onRecentlyPlayedFail(error) {
    _flow.fail();
    _callback.onProfileModuleFail(error);
  }

  void _getTopTracks() async {
    await _topUseCase.executeAsync(
        TopLogic.Parameter()..spotify = spotify, this);
  }

  @override
  void onTopSuccess(Iterable<Track> data) {
    _topTracks = data;
    _flow.next();
  }

  @override
  void onTopFail(error) {
    _flow.fail();
    _callback.onProfileModuleFail(error);
  }

  void _createProfileModel() {
    _profileModel = ProfileModel()
      ..user = _userInfo
      ..recentlyPlayed = _recentlyPlayed
      ..topTracks = _topTracks;
    _callback.onProfileModuleSuccess(_profileModel);
  }
}

class Parameter extends Base.Parameter {}

class Callback extends Base.Callback {
  void onProfileModuleSuccess(ProfileModel data) {}
  void onProfileModuleFail(dynamic error) {}
}
