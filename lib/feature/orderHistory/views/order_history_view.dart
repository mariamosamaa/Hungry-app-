import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/feature/shared/custom_btn.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 45, bottom: 90 + 20),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/test/test.png", width: 100),
                              CustomText(
                                text: "Hamburger",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: "Veggie Burger",
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Humburger", color: Colors.black),
                            CustomText(
                              text: "Veggie Burger",
                              color: Colors.black,
                            ),
                            CustomText(
                              text: "Quntity: 3X",
                              color: Colors.black,
                            ),
                            CustomText(
                              text: "Price : 20 \$",
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(16),
                    Center(
                      child: CustomBtn(text: "Re Order", hor: 100, ver: 10),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
