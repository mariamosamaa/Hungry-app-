import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/feature/product/widgets/spicy_slider.dart';
import 'package:hangry/feature/product/widgets/toppings.dart';
import 'package:hangry/feature/shared/custom_btn.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class ProdectView extends StatefulWidget {
  const ProdectView({super.key});

  @override
  State<ProdectView> createState() => _ProdectViewState();
}

class _ProdectViewState extends State<ProdectView> {
  double value = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          120, // Space for bottom sheet
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpicySlider(
              spicy: value,
              on: (v) {
                setState(() {
                  value = v;
                });
              },
            ),

            const Gap(35),

            const CustomText(
              text: "Toppings",
              color: Colors.black,
              fsize: 20,
            ),

            const Gap(10),

            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  return Toppings(
                    topname: "Tomato",
                    image: "assets/test/tomato.png",
                    onadd: () {},
                  );
                },
              ),
            ),

            const Gap(35),

            const CustomText(
              text: "Side Options",
              color: Colors.black,
              fsize: 20,
            ),

            const Gap(10),

            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  return Toppings(
                    topname: "Tomato",
                    image: "assets/test/tomato.png",
                    onadd: () {},
                  );
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      bottomSheet: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 15,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(
                  text: "Total",
                  color: Colors.black,
                  fsize: 18,
                ),
                CustomText(
                  text: "\$18.9",
                  color: Colors.black,
                  fsize: 26,
                ),
              ],
            ),
            CustomBtn(
              text: "Add To Cart",
              hor: 20,
              ver: 15,
            ),
          ],
        ),
      ),
    );
  }
}