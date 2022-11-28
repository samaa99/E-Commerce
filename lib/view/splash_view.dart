import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashView({Key? key, required this.onInitializationComplete})
      : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((_) => widget.onInitializationComplete);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash.png',
      fit: BoxFit.cover,
    );
  }
}
