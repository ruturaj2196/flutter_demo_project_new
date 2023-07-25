import 'package:flutter/material.dart';
import 'package:flutter_practice/auth/login_or_register.dart';
import 'package:lottie/lottie.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Lottie.network(
          "https://assets2.lottiefiles.com/packages/lf20_AMBEWz.json",
          controller: _controller,
          onLoaded: (animate) {
            _controller
              ..duration = animate.duration
              ..forward().then((value) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginOrRegister(),
                  ),
                );
              });
          },
        ),
      ),
    );
  }
}
