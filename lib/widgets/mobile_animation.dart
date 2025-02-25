import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MobileAnimation extends StatelessWidget {
  const MobileAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Lottie.asset('assets/mobile.json'), // Make sure you have a Lottie JSON file in assets.
    );
  }
}
