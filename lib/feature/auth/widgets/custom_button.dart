import 'package:flutter/material.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class customauthbutton extends StatelessWidget {
  const customauthbutton({
    super.key,
    required this.textbtn,
    required this.ontapp,
    this.borcolor,
    this.txtcolor,
  });
  final String textbtn;
  final Function()? ontapp;
  final Color? borcolor;
  final Color? txtcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapp,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: borcolor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: CustomText(
            text: textbtn,
            color: txtcolor ?? AppColor.appcolor,
          ),
        ),
      ),
    );
  }
}
