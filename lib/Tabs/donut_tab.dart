// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donut_app_ui/utils/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/list_of_items.dart';

class DonutTab extends StatelessWidget {
  const DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: dountOnSale.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          return DonutTile(
            dountFlavour: dountOnSale[index][0],
            dountPrice: dountOnSale[index][1],
            dountColor: dountOnSale[index][2],
            dountImg: dountOnSale[index][3],
          );
        });
  }
}

class DonutTile extends StatelessWidget {
  final String dountFlavour;
  final String dountPrice;
  final dountColor;
  final String dountImg;

  const DonutTile({
    Key? key,
    required this.dountFlavour,
    required this.dountPrice,
    required this.dountColor,
    required this.dountImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: dountColor[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          //Price
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: dountColor[100],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: CustomFont(
                    text: "\$$dountPrice",
                    fontSize: 16,
                    color: dountColor[800],
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          //Image
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Image.asset(
              dountImg,
              scale: 4.7,
            ),
          ),
          //Flavour
          CustomFont(
              text: dountFlavour,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600),
          //Name
          const SizedBox(height: 3.5),
          CustomFont(
            text: "Dumkin's",
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
