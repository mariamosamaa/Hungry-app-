import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/checkout/widgets/custom_checkout.dart';
import 'package:hangry/feature/shared/custom_btn.dart';
import 'package:hangry/feature/shared/custom_text.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedpayment = "cash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Order summary", color: Colors.black, fsize: 20),
              Gap(10),
              CustomCheckout(
                title: "Order",
                price: "18.9",
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
              Gap(10),
              CustomCheckout(
                title: "Taxes",
                price: "0.3",
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
              Gap(10),
              CustomCheckout(
                title: "Delivery fees",
                price: "1.5",
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
              Gap(10),
              Divider(),
              Gap(10),
              CustomCheckout(
                title: "Total:",
                price: "180.9",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              Gap(12),
              CustomCheckout(
                title: "Estimated delivery time:",
                price: "15 - 30 mins",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                showDollarSign: false,
              ),
              Gap(20),
              CustomText(
                text: "Payment Methods",
                color: Colors.black,
                fsize: 20,
              ),
              Gap(20),
              //paymennnnnnnnnnnnnnnnnnnnnnnnnnt
              ListTile(
                onTap: () {
                  setState(() {
                    selectedpayment = 'cash';
                  });
                },
                contentPadding: EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                tileColor: Color(0xff3C2F2F),
                leading: Image.asset("assets/icon/cash.png"),
                title: CustomText(text: "Cash on Delivery"),
                trailing: Radio(
                  activeColor: Colors.white,
                  value: "cash",
                  groupValue: selectedpayment,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedpayment = value;
                      });
                    }
                  },
                ),
              ),
              Gap(20),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedpayment = 'visa';
                  });
                },
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                tileColor: Colors.blue,
                leading: Image.asset("assets/icon/profileVisa.png", width: 60),
                title: CustomText(text: "Depit Card"),
                subtitle: CustomText(text: "**** **** **** 5189"),
                trailing: Radio(
                  activeColor: Colors.white,
                  value: "visa",
                  groupValue: selectedpayment,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedpayment = value;
                      });
                    }
                  },
                ),
              ),
              Gap(8),
              Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xffEF2A39),
                    value: true,
                    onChanged: (v) {},
                  ),
                  CustomText(
                    text: "Save card details for future payments",
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fsize: 14,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

        height: 90,
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
                showDialog(
                  context: context,
                  builder: (c) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 120,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade800,
                                blurRadius: 15,
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30),
                          ),

                          child: Column(
                            children: [
                              Gap(20),
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: AppColor.appcolor,
                                child: Icon(
                                  CupertinoIcons.check_mark,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              Gap(10),
                              CustomText(
                                text: "Success !",
                                color: AppColor.appcolor,
                                fsize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              Text(
                                "Your payment was successful.\nA receipt for this purchase has\n     been sent to your email.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Gap(60),
                              CustomBtn(
                                text: "Close",
                                hor: 60,
                                ver: 20,
                                ontap: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: CustomBtn(text: "Pay Now", hor: 40, ver: 15),
            ),
          ],
        ),
      ),
    );
  }
}
