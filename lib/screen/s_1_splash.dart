import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.pushReplacementNamed(context, '/planner');
    // Navigator.pushNamedAndRemoveUntil(context, '/planner', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          height: 50,
          image: AssetImage('assets/logo.png'),
        ),
      ),
    );
  }
}
