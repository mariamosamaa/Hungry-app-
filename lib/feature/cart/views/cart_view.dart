import 'package:flutter/material.dart';
import 'package:hangry/feature/cart/widgets/cart_item.dart';
import 'package:hangry/feature/checkout/views/checkout_view.dart';
import 'package:hangry/feature/shared/custom_btn.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  static const double bottomSheetHeight = 90;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemcount = 20;

  late List<int> qty;

  @override
  void initState() {
    qty = List.generate(itemcount, (_) => 1);
    super.initState();
  }

  void onadd(int index) {
    setState(() {
      qty[index]++;
    });
  }

  void onmin(int index) {
    setState(() {
      if (qty[index] > 1) {
        qty[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: 45,
            bottom: CartView.bottomSheetHeight + 20,
          ),
          itemCount: itemcount,
          itemBuilder: (context, index) {
            return CartItem(
              name: "Hamburger",
              des: "Veggie Burger",
              image: "assets/test/test.png",
              number: qty[index],
              onadd: () => onadd(index),
              onmin: () => onmin(index),
            );
          },
        ),
      ),
      bottomSheet: Container(
        height: CartView.bottomSheetHeight,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF424242),
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Total", color: Colors.black, fsize: 18),
                CustomText(text: "\$18.9", color: Colors.black, fsize: 24),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => CheckoutView()),
                );
              },
              child: CustomBtn(text: "Checkout", hor: 40, ver: 15),
            ),
          ],
        ),
      ),
    );
  }
}
