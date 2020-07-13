import 'package:generify/constants/routes.dart';
import 'package:generify/constants/secrets.dart';
import 'package:generify/service/route_service.dart';
import 'package:generify/ui/locator.dart';
import 'package:spotify/spotify.dart';
import 'package:oauth2/src/authorization_code_grant.dart' as AuthCodeGrant;
import 'package:generify/logic/bloc/base/base_bloc.dart' as Base;
import 'package:generify/logic/bloc/bottom_navigation_page_bloc.dart'
    as BottomNavigation;

class Bloc extends Base.Bloc {
  final RouteService _router = locator<RouteService>();
  final String _redirectUri = Secrets.REDIRECT_URI;
  AuthCodeGrant.AuthorizationCodeGrant _grant;
  Uri _authUri;

  @override
  void onCreate({Object arguments}) {
    initSecrets();
  }

  void initSecrets() {
    final credentials =
        SpotifyApiCredentials(Secrets.CLIENT_ID, Secrets.CLIENT_SECRET);
    _grant = SpotifyApi.authorizationCodeGrant(credentials);
    _authUri = _grant.getAuthorizationUrl(Uri.parse(_redirectUri),
        scopes: Secrets.SCOPES);
    notifyListeners();
  }

  void onAuthEnd(String responseUri) async {
    final spotify = SpotifyApi.fromAuthCodeGrant(_grant, responseUri);
    await _router.goToRoute(Routes.bottom_navigation_page,
        arguments: BottomNavigation.Parameter()..spotify = spotify);
  }

  String get redirectUri => _redirectUri;
  String get authUri => _authUri.toString();
}
