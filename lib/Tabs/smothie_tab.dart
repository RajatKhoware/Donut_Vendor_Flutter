import 'package:donut_app_ui/utils/list_of_items.dart';
import 'package:flutter/material.dart';
import '../utils/custom_gridview.dart';

class SmothieTab extends StatelessWidget {
  const SmothieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      listOfProduct: smoothieOnSale,
      category: "Smoothie's",
      productImg: "assets/food_img/smothie/3d_smoothie.png",
      imgScale: 2.0,
      productBgColor: Color.fromARGB(255, 246, 237, 233),
    );
  }
}
