import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:generify/logic/bloc/login_page_bloc.dart' as Login;

Object _args;

class LoginPage extends StatefulWidget {
  LoginPage(args) {
    _args = args;
  }
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Login.Bloc(), child: PageBody());
  }
}

class PageBody extends StatefulWidget {
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  @override
  Widget build(BuildContext context) {
    Login.Bloc bloc = Provider.of<Login.Bloc>(context);
    bloc.onCreate();

    return Container(
      child: Center(
        child: RaisedButton(
            child: Text("Login with Spotify"),
            onPressed: () {
              bloc.onLoginButtonClick();
            }),
      ),
    );
  }
}
