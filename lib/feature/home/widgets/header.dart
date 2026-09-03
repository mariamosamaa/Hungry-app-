import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/logo/logo.svg",
              color: AppColor.appcolor,
              height: 35,
            ),
            Gap(5),
            CustomText(
              text: "Hello, Guest",
              color: Colors.grey.shade600,
              fsize: 18,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColor.appcolor,
          child: Icon(CupertinoIcons.person, color: Colors.white),
        ),
      ],
    );
  }
}
