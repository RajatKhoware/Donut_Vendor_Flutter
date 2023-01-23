import 'package:donut_app_ui/pages/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import '../pages/details_page.dart';

class CustomGridView extends StatefulWidget {
  final List listOfProduct;
  final String productImg;
  final Color productBgColor;
  final double? imgScale;

  const CustomGridView({
    Key? key,
    required this.listOfProduct,
    required this.productImg,
    required this.productBgColor,
    this.imgScale = 4.7,
  }) : super(key: key);

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

//List of items present in cart
List<dynamic> cartItems = [];

class _CustomGridViewState extends State<CustomGridView> {
  //Product count present in cart
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: widget.listOfProduct.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.54,
        ),
        itemBuilder: (context, index) {
          final product = widget.listOfProduct[index];
          return ProductTile(
            productName: product[0],
            productPrice: product[1],
            productColor: product[2],
            productImg: product[3],
            productCategory: product[5],
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item added to cart'),
                  duration: Duration(seconds: 2),
                ),
              );
              for (var item in cartItems) {
                if (item[0] == product[0]) {
                  itemCount++;
                  return;
                }
              }
              itemCount = 1;
              cartItems.add(widget.listOfProduct[index]);
              setState(() {});
            },
          );
        });
  }
}
