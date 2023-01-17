import 'package:donut_app_ui/utils/product_tile.dart';
import 'package:flutter/material.dart';

import '../pages/details_page.dart';
import 'list_of_items.dart';

class CustomGridView extends StatelessWidget {
  final List listOfProduct;
  final String category;
  final String productImg;
  final Color productBgColor;
  final double? imgScale;
  const CustomGridView({
    Key? key,
    required this.listOfProduct,
    required this.category,
    required this.productImg,
    required this.productBgColor,
    this.imgScale = 4.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: dountOnSale.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          final product = listOfProduct[index];
          return ProductTile(
            productName: product[0],
            productPrice: product[1],
            productColor: product[2],
            productImg: product[3],
            productCategory: category,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    productName: product[0],
                    productImg: productImg,
                    productDetail: product[4],
                    productBgColor: productBgColor,
                    imgScale: imgScale,
                  ),
                ),
              );
            },
          );
        });
  }
}


