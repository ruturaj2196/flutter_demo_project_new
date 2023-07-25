import 'package:flutter/material.dart';
import 'package:flutter_practice/login_page/login.dart';
import 'package:flutter_practice/login_page/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
// initially show the login page
  bool showLoginPage = true;

  // create a function to toggle between login and register page
  void loginOrRegister() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: loginOrRegister);
    } else {
      return Register(onTap: loginOrRegister);
    }
  }
}
