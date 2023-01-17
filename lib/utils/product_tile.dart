import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class ProductTile extends StatelessWidget {
  final String productName;
  final String productPrice;
  final productColor;
  final String productImg;
  final String productCategory;
  final VoidCallback onTap;

  const ProductTile({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImg,
    required this.productCategory,
    required this.onTap,
    this.productColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: productColor[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          //Price
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: productColor[100],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: CustomFont(
                    text: "\$$productPrice",
                    fontSize: 16,
                    color: productColor[800],
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          //Image
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: InkWell(
              onTap: onTap,
              child: Image.asset(
                productImg,
                scale: 4.7,
              ),
            ),
          ),
          //Flavour
          InkWell(
            onTap: onTap,
            child: CustomFont(
                text: productName,
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          //Name
          const SizedBox(height: 3.5),
          CustomFont(
            text: productCategory,
            fontSize: 12,
            color: Colors.black.withOpacity(0.4),
            fontWeight: FontWeight.w600,
          ),
          //Buttons
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CupertinoIcons.heart_fill,
                  size: 20,
                  color: Colors.pink.shade400,
                ),
                Icon(
                  CupertinoIcons.add,
                  size: 20,
                  color: Colors.pink.shade400,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}