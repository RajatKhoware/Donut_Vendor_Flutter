// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donut_app_ui/utils/my_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Tabs/burger_tab.dart';
import '../Tabs/coffee_tab.dart';
import '../Tabs/donut_tab.dart';
import '../Tabs/pizza_tab.dart';
import '../Tabs/smothie_tab.dart';
import '../utils/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //donut tab
    const MyTab(iconPath: "assets/icons/icon_donut.png"),
    //coffee tab
    const MyTab(iconPath: "assets/icons/icon_coffee.png"),
    //burger tab
    const MyTab(iconPath: "assets/icons/icon_burger.png"),
    //smothie tab
    const MyTab(iconPath: "assets/icons/icon_smoothie.png"),
    //pizza tab
    const MyTab(iconPath: "assets/icons/icon_pizza.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              // I want to Eat
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Row(
                  children: const [
                    CustomFont(
                        text: "I want to ",
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    CustomFont(
                        text: "Eat",
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Tab bar
              TabBar(
                tabs: myTabs,
                indicatorPadding: const EdgeInsets.all(6.0),
                indicator: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              // Tab bar view
               Expanded(
                child: TabBarView(
                  children: [
                    //Dount page
                    DonutTab(),
                    //Coffee page
                    CoffeeTab(),
                    //Burger page
                    BurgerTab(),
                    //Smothie page
                    SmothieTab(),
                    //Pizza page
                    PizzaTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
