import 'package:flutter/material.dart';
import 'package:flutter_practice/login_page/button.dart';
import 'package:flutter_practice/login_page/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = _email.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_outline_rounded,
                  size: 80,
                ),
                const Text(
                  'Welcome back !',
                  style: TextStyle(fontSize: 20),
                ),
                InputField(
                  readOnly: false,
                  obsecureText: false,
                  hintText: 'email',
                  controller: _email,
                ),
                InputField(
                  readOnly: false,
                  obsecureText: true,
                  hintText: 'Password',
                  controller: _password,
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                    ontap: () {
                      username;
                      debugPrint('$username.........');
                    },
                    text: 'Sign in'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now!',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
