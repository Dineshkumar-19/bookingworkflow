import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bookworkflow/core/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.replaceRoute(const HomeRoute());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff44106D), Color(0xff7B42F6)],
          ),
        ),
        child: Stack(
          children: [
            SizedBox(height: 30),

            /// Background Watermark
            Positioned.fill(
              child: IgnorePointer(
                child: Align(
                  alignment: const Alignment(0, 0.45), // Move image downward
                  child: Opacity(
                    opacity: 0.09,
                    child: Image.asset(
                      "assets/images/splash_logo_back.png",
                      height: 600,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset("assets/images/splash_logo.png"),
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Connecting devotees with sacred pandits",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        width: 180,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            context.replaceRoute(const HomeRoute());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF59E0B),
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Get Started ➜",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
