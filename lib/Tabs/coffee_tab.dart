import 'package:donut_app_ui/utils/list_of_items.dart';
import 'package:flutter/material.dart';
import '../utils/custom_gridview.dart';

class CoffeeTab extends StatelessWidget {
  const CoffeeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      listOfProduct: coffeeOnSale,
      productImg: "assets/food_img/coffee/3d_coffee.png",
      imgScale: 3.6,
      productBgColor: const Color.fromARGB(255, 246, 237, 233),
    );
  }
}
