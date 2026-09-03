import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class Toppings extends StatelessWidget {
  const Toppings({
    super.key,
    required this.topname,
    required this.image,
    this.onadd,
  });
  final String topname, image;
  final Function()? onadd;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xff3C2F2F),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(text: topname),
                  Gap(5),
                  InkWell(
                    onTap: onadd,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, -2), // Shadow toward the top
              ),
            ],
          ),
          child: Image.asset(image),
        ),
      ],
    );
  }
}
