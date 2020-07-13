import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:generify/logic/bloc/auth_webview_page_bloc.dart' as AuthWebView;

Object _args;

class AuthWebViewPage extends StatefulWidget {
  AuthWebViewPage(Object args) {
    _args = args;
  }
  @override
  _AuthWebViewPageState createState() => _AuthWebViewPageState();
}

class _AuthWebViewPageState extends State<AuthWebViewPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthWebView.Bloc(), child: PageBody());
  }
}

class PageBody extends StatefulWidget {
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AuthWebView.Bloc>(context);
    bloc.onCreate();

    return Container(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: bloc.authUri,
        navigationDelegate: (navReq) {
          if (navReq.url.startsWith(bloc.redirectUri)) {
            var responseUri = navReq.url;
            bloc.onAuthEnd(responseUri);
          }
        },
      ),
    );
  }
}
