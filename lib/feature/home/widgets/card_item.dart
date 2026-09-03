import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.name,
    required this.des,
    required this.rate,
  });
  final String image, name, des, rate;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: -10,
                  child: Image.asset("assets/icon/shadow.png"),
                ),
                Center(child: Image.asset(image, width: 120, height: 120)),
              ],
            ),
            Gap(10),
            CustomText(
              text: name,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            CustomText(text: des, color: Colors.black),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(CupertinoIcons.star),
                CustomText(text: rate, color: Colors.black),
                Spacer(),
                Icon(CupertinoIcons.heart, color: AppColor.appcolor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
