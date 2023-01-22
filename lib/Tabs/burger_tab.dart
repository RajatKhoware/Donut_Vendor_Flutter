import 'package:donut_app_ui/utils/list_of_items.dart';
import 'package:flutter/material.dart';
import '../utils/custom_gridview.dart';

class BurgerTab extends StatelessWidget {
  const BurgerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      listOfProduct: burgerOnSale,
      productImg: "assets/food_img/burger/3d_burger.png",
      imgScale: 6.2,
      productBgColor: Color.fromARGB(255, 246, 230, 223),
    );
  }
}
