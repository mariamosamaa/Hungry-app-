import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/shared/custom_btn.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.name,
    required this.des,
    required this.image,
    required this.number,
    this.onadd,
    this.onmin,
    this.onremove,
  });
  final String name, des, image;
  final Function()? onadd;
  final Function()? onmin;
  final Function()? onremove;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 100),
                CustomText(
                  text: name,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(text: des, color: Colors.black),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onadd,
                      child: CircleAvatar(
                        backgroundColor: AppColor.appcolor,
                        child: Icon(CupertinoIcons.add, color: Colors.white),
                      ),
                    ),
                    Gap(20),
                    CustomText(
                      text: number.toString(),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fsize: 20,
                    ),
                    Gap(20),
                    GestureDetector(
                      onTap: onmin,
                      child: CircleAvatar(
                        backgroundColor: AppColor.appcolor,
                        child: Icon(CupertinoIcons.minus, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Gap(20),
                GestureDetector(
                  onTap: onremove,
                  child: CustomBtn(text: "Remove", hor: 40, ver: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
