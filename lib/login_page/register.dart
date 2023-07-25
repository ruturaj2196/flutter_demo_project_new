import 'package:flutter/material.dart';
import 'package:flutter_practice/login_page/button.dart';
import 'package:flutter_practice/login_page/text_field.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
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
                  'Let\' create an account!',
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
                InputField(
                  readOnly: false,
                  obsecureText: true,
                  hintText: 'Confirm password',
                  controller: _confirmPassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(ontap: () {}, text: 'Sign in'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('already have an account?'),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now!',
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
