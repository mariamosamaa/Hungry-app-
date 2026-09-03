import 'package:flutter/cupertino.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.text, this.ontap, required this.hor, required this.ver});
  final String text;
  final Function()? ontap;
  final double hor, ver;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: hor, vertical: ver),
        decoration: BoxDecoration(
          color: AppColor.appcolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: CustomText(text: text),
      ),
    );
  }
}
