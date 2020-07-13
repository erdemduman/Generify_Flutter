import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:generify/logic/bloc/base/base_bloc.dart' as Base;
import 'package:generify/logic/bloc/module/base/base_module.dart';
import 'package:generify/logic/bloc/module/profile_module.dart' as Profile;
import 'package:generify/model/profile_model.dart';
import 'package:generify/utils/dominant_color.dart';

class Bloc extends Base.Bloc implements Profile.Callback {
  final List<TabData> _barItems = [
    TabData(
      iconData: Icons.home,
      title: "Home",
    ),
    TabData(
      iconData: Icons.playlist_play,
      title: "Playlist",
    ),
    TabData(
      iconData: Icons.notifications,
      title: "Notifications",
    ),
    TabData(
      iconData: Icons.face,
      title: "Profile",
    )
  ];
  final List<Module> _modules = [Profile.Module()];
  ProfileModel _profileData;
  int _currentTab = 0;
  Uri _authUri;
  Parameter _parameter;
  bool _isLoading;
  Color _avatarBackgroundColor;

  Bloc() {}

  @override
  void onCreate({Object arguments}) {
    _parameter = arguments as Parameter;
  }

  void onTabSelected(int tab) async {
    _currentTab = tab;
    if (_profileData == null) {
      _loadData();
    }
    notifyListeners();
  }

  Future<void> pullToRefresh() {
    _loadData();
  }

  void _loadData() async {
    _isLoading = true;
    await _modules[0]
        .executeFlow(Profile.Parameter()..spotify = _parameter.spotify, this);
    notifyListeners();
  }

  @override
  void onProfileModuleSuccess(ProfileModel data) async {
    _profileData = data;
    _avatarBackgroundColor =
        await getImagePalette(NetworkImage(_profileData.user.images[0].url));
    _isLoading = false;
    notifyListeners();
  }

  @override
  void onProfileModuleFail(error) {}

  List<TabData> get barItems => _barItems;
  int get currentTab => _currentTab;
  Uri get authUri => _authUri;
  ProfileModel get profileData => _profileData;
  bool get isLoading => _isLoading;
  Color get avatarBackgroundColor => _avatarBackgroundColor;
}

class Parameter extends Base.Parameter {}
