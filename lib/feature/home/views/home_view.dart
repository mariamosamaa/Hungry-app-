import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hangry/feature/home/widgets/card_item.dart';
import 'package:hangry/feature/home/widgets/category.dart';
import 'package:hangry/feature/home/widgets/header.dart';
import 'package:hangry/feature/home/widgets/search.dart';
import 'package:hangry/feature/product/views/prodect_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['All', 'Combo', 'Sliders', 'Classic'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              toolbarHeight: 150,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
                child: Column(children: [Header(), Gap(20), Search()]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19.0),
                child: Column(
                  children: [
                    Gap(17),
                    Category(selectedIndex: selectedIndex, category: category),
                    Gap(17),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 6, (
                  context,
                  index,
                ) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => ProdectView()),
                    ),
                    child: CardItem(
                      image: "assets/test/test.png",
                      name: "Cheese Burger",
                      des: "Wendy's Burger",
                      rate: " 4.9",
                    ),
                  );
                }),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
