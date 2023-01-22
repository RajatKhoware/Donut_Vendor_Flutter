// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:donut_app_ui/utils/custom_gridview.dart';
import 'package:donut_app_ui/utils/custom_text.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  @override
  Widget build(BuildContext context) {
    double _totalSum = 0.0;
    if (cartItems.isNotEmpty) {
      _totalSum = cartItems
          .map((item) => double.parse(item[1]))
          .reduce((value, element) => value + element);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        title: const CustomFont(
          text: "Cart 🛒",
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartItems.isNotEmpty
                    ? SizedBox(
                        width: 400,
                        height: 570,
                        child: ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final product = cartItems[index];
                              return CartProductTile(
                                productName: product[0].toString(),
                                productCategory: product[5].toString(),
                                productPrice: product[1].toString(),
                                productImg: product[3].toString(),
                                productDelete: () {
                                  setState(() {
                                    _totalSum = cartItems
                                        .map((item) => double.parse(item[1]))
                                        .reduce((value, element) =>
                                            value + element);
                                    cartItems.removeAt(index);
                                    print(cartItems.length);
                                  });
                                },
                              );
                            }),
                      )
                    : const SizedBox(
                        width: 400,
                        height: 570,
                        child: Center(child: CircularProgressIndicator())),
                Container(
                  width: 370,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 2.0,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 12, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFont(
                                text:
                                    "Total: \$${_totalSum.toStringAsFixed(2)}",
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                            const SizedBox(height: 2.5),
                            CustomFont(
                                text: "Delivery Charges :- \$1/Km",
                                fontSize: 13,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        const CustomFont(
                            text: "BUY",
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
    );
  }
}

class CartProductTile extends StatefulWidget {
  final String productName;
  final String productCategory;
  final String productPrice;
  final String productImg;
  final VoidCallback productDelete;
  const CartProductTile({
    Key? key,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
    required this.productImg,
    required this.productDelete,
  }) : super(key: key);

  @override
  State<CartProductTile> createState() => _CartProductTileState();
}

class _CartProductTileState extends State<CartProductTile> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(14, 0, 0, 0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Image.asset(widget.productImg, scale: 6),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: widget.productName,
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5),
                  CustomFont(
                    text: widget.productCategory,
                    fontSize: 12,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 6),
                  CustomFont(
                    text: "\$ ${widget.productPrice}",
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (itemCount > 1) {
                              itemCount--;
                            }
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.0, color: Colors.black45),
                              color: Colors.white54),
                          child: const Center(
                            child: CustomFont(
                              text: "—",
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      CustomFont(
                        text: itemCount.toString(),
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            itemCount++;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.0, color: Colors.black45),
                              color: Colors.white54),
                          child: const Center(
                            child: CustomFont(
                              text: "+",
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      InkWell(
                        onTap: widget.productDelete,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.0, color: Colors.black26),
                              color: Colors.white54),
                          child: const Center(
                              child: Icon(
                            CupertinoIcons.delete,
                            size: 22,
                            color: Color.fromARGB(255, 255, 0, 0),
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
