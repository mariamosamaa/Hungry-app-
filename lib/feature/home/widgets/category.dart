import 'package:flutter/material.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/shared/custom_text.dart';

// ignore: must_be_immutable
class Category extends StatefulWidget {
  Category({super.key, required this.selectedIndex, required this.category});
  late int selectedIndex;
  final List category;
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late int selectedindex;
  @override
  void initState() {
     selectedindex=widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.category.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedindex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                color: selectedindex == index
                    ? AppColor.appcolor
                    : Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomText(
                text: widget.category[index],
                color: selectedindex == index
                    ? Colors.white
                    : Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }),
      ),
    );
  }
}
