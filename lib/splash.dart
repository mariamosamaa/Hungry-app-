import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/auth/view/login_view.dart';


class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          _animate = true;
        });
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, animation, __) => const LoginView(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appcolor,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(180),

            /// Logo Animation
            AnimatedOpacity(
              duration: const Duration(milliseconds: 900),
              opacity: _animate ? 1 : 0,
              curve: Curves.easeOut,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 900),
                scale: _animate ? 1 : 0.8,
                curve: Curves.easeOutBack,
                child: SvgPicture.asset("assets/logo/logo.svg"),
              ),
            ),

            const Spacer(),

            /// Bottom Image Animation
            AnimatedSlide(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic,
              offset: _animate ? Offset.zero : const Offset(0, 0.4),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _animate ? 1 : 0,
                child: Image.asset("assets/splash/splash.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
