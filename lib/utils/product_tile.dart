// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'custom_text.dart';

class ProductTile extends StatefulWidget {
  final String productName;
  final String productPrice;
  final productColor;
  final String productImg;
  final String productCategory;
  final VoidCallback onTap;
  final VoidCallback addToCart;

  const ProductTile({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImg,
    required this.productCategory,
    required this.onTap,
    required this.addToCart,
    this.productColor,
  }) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.productColor[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          //Price
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.productColor[100],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: CustomFont(
                    text: "\$${widget.productPrice}",
                    fontSize: 16,
                    color: widget.productColor[800],
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          //Image
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: InkWell(
              onTap: widget.onTap,
              child: Image.asset(
                widget.productImg,
                scale: 4.7,
              ),
            ),
          ),
          //Flavour
          InkWell(
            onTap: widget.onTap,
            child: CustomFont(
                text: widget.productName,
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          //Name
          const SizedBox(height: 3.5),
          CustomFont(
            text: widget.productCategory,
            fontSize: 12,
            color: Colors.black.withOpacity(0.4),
            fontWeight: FontWeight.w600,
          ),
          //Buttons
          //const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 65,
                  height: 49,
                  child: InkWell(
                      onTap: () {
                        if (liked == false) {
                          liked = true;
                          controller.forward();
                        } else {
                          liked = false;
                          controller.reverse();
                        }
                      },
                      child: Lottie.network(
                        "https://assets10.lottiefiles.com/packages/lf20_2THqE1.json",
                        controller: controller,
                        fit: BoxFit.fill,
                      )),
                ),
                InkWell(
                  onTap: widget.addToCart,
                  child: Icon(
                    CupertinoIcons.add,
                    size: 20,
                    color: Colors.pink.shade400,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
