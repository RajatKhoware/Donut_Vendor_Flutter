// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donut_app_ui/utils/custom_gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/list_of_items.dart';

class DonutTab extends StatelessWidget {
  const DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      listOfProduct: dountOnSale,
      productImg: "assets/food_img/donut/3d_donut.png",
      productBgColor: Color.fromARGB(255, 250, 245, 247),
    );
  }
}

