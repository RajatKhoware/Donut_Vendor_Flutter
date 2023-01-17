// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:donut_app_ui/utils/custom_text.dart';

class DetailsPage extends StatelessWidget {
  final String productName;
  final String productImg;
  final String productDetail;
  final Color productBgColor;
  final double? imgScale;
  const DetailsPage({
    Key? key,
    required this.productName,
    required this.productImg,
    required this.productDetail,
    required this.productBgColor,
    this.imgScale = 4.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
              child: Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: productBgColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 60,
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              CupertinoIcons.back,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 20),
                          CustomFont(
                              text: productName,
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                    Image.asset(
                      productImg,
                      scale: imgScale,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 370, left: 5, right: 5),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomFont(
                          text: "Ingredients",
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Ingredients_Details(
                              ingredientName: "Sugar",
                              quantity: "2",
                              color: Colors.blue),
                          Ingredients_Details(
                              ingredientName: "Salt",
                              quantity: ".3",
                              color: Colors.pink),
                          Ingredients_Details(
                              ingredientName: "Fat",
                              quantity: "12",
                              color: Colors.yellow),
                          Ingredients_Details(
                              ingredientName: "Energy",
                              quantity: "40",
                              color: Colors.pink),
                        ],
                      ),
                      SizedBox(height: 20),
                      const CustomFont(
                          text: "Details",
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      SizedBox(height: 6),
                      Text(
                        productDetail,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 330,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2.0,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 12, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomFont(
                                      text: "\$12.75",
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                  const SizedBox(height: 2.5),
                                  CustomFont(
                                      text: "Delivery Not Included",
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                              const CustomFont(
                                  text: "Add to Cart",
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class Ingredients_Details extends StatelessWidget {
  final String ingredientName;
  final String quantity;
  final color;

  const Ingredients_Details({
    Key? key,
    required this.ingredientName,
    required this.quantity,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          width: 2.0,
          color: Colors.black.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 25),
          CustomFont(
              text: ingredientName,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 5),
          CustomFont(
              text: "8 Gram",
              fontSize: 10,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 5),
          CircleAvatar(
            radius: 27.0,
            backgroundColor: color[100],
            child: CustomFont(
                text: "$quantity%",
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
