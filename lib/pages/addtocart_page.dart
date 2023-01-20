import 'package:donut_app_ui/utils/custom_gridview.dart';
import 'package:flutter/material.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: 400,
            height: 600,
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartItems[index];
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(product[0].toString()),
                        Text(product[1].toString()),
                        Text(product[2].toString()),
                        Text(product[3].toString()),
                        Text(product[4].toString()),
                      ],
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
