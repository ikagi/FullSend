import 'package:flutter/cupertino.dart';
import 'package:full_send/pages/login_screen.dart';
import 'package:full_send/pages/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(onTap: tooglePages);
    } else {
      return RegisterScreen(onTap: tooglePages);
    }
  }
}
