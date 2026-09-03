import 'package:flutter/material.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class CustomCheckout extends StatelessWidget {
  const CustomCheckout({
    super.key,
    required this.title,
    required this.price,
    this.showDollarSign = true,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 15,
  });

  final String title;
  final String price;
  final bool showDollarSign;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            color: color,
            fsize: fontSize,
            fontWeight: fontWeight,
          ),
          CustomText(
            text: showDollarSign ? "\$ $price" : price,
            color: color,
            fsize: fontSize,
            fontWeight: fontWeight,
          ),
        ],
      ),
    );
  }
}