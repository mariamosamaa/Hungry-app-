import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/feature/auth/view/profile.dart';
import 'package:hangry/feature/cart/views/cart_view.dart';
import 'package:hangry/feature/home/views/home_view.dart';
import 'package:hangry/feature/orderHistory/views/order_history_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller = PageController();
  late List<Widget> views;
  int currenview = 0;
  @override
  void initState() {
    views = [HomeView(), CartView(), OrderHistoryView(), profileview()];
    controller = PageController(initialPage: currenview);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currenview = index;
            });
          },
          physics: NeverScrollableScrollPhysics(),
          children: views,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.appcolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade700,
            onTap: (value) {
              setState(() {
                currenview = value;
              });
              controller.jumpToPage(currenview);
            },
            currentIndex: currenview,
      
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu_sharp),
                label: "Order History",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
