import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:career_connect_app/constant/theme/external_colors.dart';

import 'package:career_connect_app/features/screens/onboarding/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoAnimation;

  bool _animationFinished = false;

  @override
  void initState() {
    super.initState();

    // Smooth logo animation
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOut,
    );

    _logoController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  Widget _buildFinalText() {
    return const Text(
      "Career Connect",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: ExternalColors.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExternalColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// LOGO
              ScaleTransition(
                scale: _logoAnimation,
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: Image.asset(
                    'assets/images/logo/Minimalist Cobalt and Teal Logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// FIXED TEXT AREA
              SizedBox(
                width: 320,
                height: 50,
                child: Center(
                  child: _animationFinished
                      ? _buildFinalText()
                      : AnimatedTextKit(
                          totalRepeatCount: 1,
                          isRepeatingAnimation: false,
                          pause: const Duration(milliseconds: 400),
                          onFinished: () async {
                            setState(() {
                              _animationFinished = true;
                            });

                            await Future.delayed(const Duration(seconds: 2));

                            if (!mounted) return;

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => HomeScreen()),
                            );
                          },
                          animatedTexts: [
                            FadeAnimatedText(
                              "Search",
                              duration: const Duration(seconds: 2),
                              textAlign: TextAlign.center,
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: ExternalColors.text,
                              ),
                            ),
                            FadeAnimatedText(
                              "Apply",
                              duration: const Duration(seconds: 2),
                              textAlign: TextAlign.center,
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: ExternalColors.text,
                              ),
                            ),
                            FadeAnimatedText(
                              "Grow",
                              duration: const Duration(seconds: 2),
                              textAlign: TextAlign.center,
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: ExternalColors.text,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
