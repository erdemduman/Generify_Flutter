import 'package:generify/constants/routes.dart';
import 'package:generify/service/route_service.dart';
import 'package:generify/ui/locator.dart';
import 'package:generify/logic/bloc/base/base_bloc.dart' as Base;

class Bloc extends Base.Bloc {
  final RouteService _routeService = locator<RouteService>();

  @override
  void onCreate({Object arguments}) {}

  void onLoginButtonClick() async {
    await _routeService.goToRoute(Routes.auth_page);
  }
}
