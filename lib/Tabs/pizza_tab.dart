import 'package:donut_app_ui/utils/list_of_items.dart';
import 'package:flutter/material.dart';
import '../utils/custom_gridview.dart';

class PizzaTab extends StatelessWidget {
  const PizzaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      listOfProduct: pizzaOnSale,
      category: "Pizza",
      productImg: "assets/food_img/pizza/3d_pizza.png",
      imgScale: 4,
      productBgColor: Color.fromARGB(255, 246, 233, 233),
    );
  }
}
