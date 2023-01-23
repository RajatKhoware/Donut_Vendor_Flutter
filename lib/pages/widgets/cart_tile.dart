import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_ui/utils/custom_text.dart';
import 'incre_dec_button.dart';

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
                      IncrementDecrementButton(
                          isIncrement: false,
                          onTap: () {
                            setState(() {
                              if (itemCount > 1) {
                                itemCount--;
                              }
                            });
                          }),
                      const SizedBox(width: 20),
                      CustomFont(
                        text: itemCount.toString(),
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(width: 20),
                      IncrementDecrementButton(
                          isIncrement: true,
                          onTap: () {
                            setState(() {
                              itemCount++;
                            });
                          }),
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
