import 'package:donut_app_ui/utils/product_tile.dart';
import 'package:flutter/material.dart';

import '../pages/details_page.dart';
import 'list_of_items.dart';

List<dynamic> cartItems = [];

class CustomGridView extends StatefulWidget {
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
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: dountOnSale.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.54),
        itemBuilder: (context, index) {
          final product = widget.listOfProduct[index];
          return ProductTile(
            productName: product[0],
            productPrice: product[1],
            productColor: product[2],
            productImg: product[3],
            productCategory: widget.category,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    productName: product[0],
                    productImg: widget.productImg,
                    productDetail: product[4],
                    productBgColor: widget.productBgColor,
                    imgScale: widget.imgScale,
                  ),
                ),
              );
            },
            addToCart: () {
              cartItems.add(dountOnSale[index]);
              print(cartItems.length);
              setState(() {});
            },
          );
        });
  }
}



// add to cart button taped -> we want to store the data of the taped item in a list -> and then using this we can show the data to use of add to cart with total price 
//Add to cart button tapped -> cart me add ho jaye and remove from cart button show ho jaye -> total amonut show ho jaye jitne bhi product hai cart me sabka mila kar