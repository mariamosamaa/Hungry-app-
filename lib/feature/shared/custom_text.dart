import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.fsize,
  });
  final String text;
  final Color? color;
  final double? fsize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textScaler: TextScaler.linear(1.0),
      style: TextStyle(
        fontSize: fsize ?? 16,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
