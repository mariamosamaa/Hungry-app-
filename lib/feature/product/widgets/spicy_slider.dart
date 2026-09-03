import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({super.key, required this.spicy, required this.on});
  final double spicy;
  final ValueChanged<double> on;
  @override
  Widget build(BuildContext context) {
    return   Row(
              children: [
                Image.asset(
                  "assets/detail/sandwitch_detail.png",
                  height: 220,
                  width: 127,
                ),
                Spacer(),
                Column(
                  children: [
                    CustomText(
                      text:
                          "Customize Your Burger\n to Your Tastes.\n Ultimate Experience",
                      color: Colors.black,
                    ),
                    Slider(
                      min: 0,
                      max: 2,
                      value: spicy,
                      onChanged: on,
                      activeColor: AppColor.appcolor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Hot
                        CustomText(text: "🥶"),
                        Gap(110),
                        CustomText(text: "🌶️"),
                      ],
                    ),
                  ],
                ),
              ],
            )
        ;
  }
}