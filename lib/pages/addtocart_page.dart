// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donut_app_ui/pages/widgets/cart_tile.dart';
import 'package:donut_app_ui/pages/widgets/check_out.dart';
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
    //Total price
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
                    ?
                    //When cart is not empty
                    SizedBox(
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
                    :
                    //When cart is empty
                    SizedBox(
                        width: 400,
                        height: 570,
                        child: Center(
                          child: Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 100, bottom: 40),
                              child: Image.asset(
                                "assets/icons/empty-cart.png",
                                scale: 2.0,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15, bottom: 5),
                              child: CustomFont(
                                text: "Your cart is empty 🥺",
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const CustomFont(
                              text: "Please add some items",
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ]),
                        ),
                      ),
                cartItems.isNotEmpty
                    ?
                    //When cart is not empty
                    CheckOutContainer(totalSum: _totalSum)
                    :
                    //When cart is not empty
                    const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



