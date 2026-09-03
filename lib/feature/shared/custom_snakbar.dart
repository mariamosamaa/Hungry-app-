import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/feature/shared/custom_text.dart';

SnackBar customsnackbar(errmsg) {
  return  SnackBar(
          content: Row(
            children: [
              Icon(CupertinoIcons.info, color: Colors.white),
              Gap(15),
              Expanded(
                child: CustomText(text: errmsg, color: Colors.white),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 240, 9, 9),
          padding: EdgeInsets.all(10),
          elevation: 30,
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
        )
      ;
}