
import 'package:flutter/material.dart';
import 'package:donut_app_ui/utils/custom_text.dart';
class CheckOutContainer extends StatelessWidget {
  const CheckOutContainer({
    Key? key,
    required double totalSum,
  })  : _totalSum = totalSum,
        super(key: key);

  final double _totalSum;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.only(left: 20, top: 12, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFont(
                    text: "Total: \$${_totalSum.toStringAsFixed(2)}",
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/order_placed");
                },
                child: Container(
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black),
                  child: const Center(
                    child: CustomFont(
                        text: "BUY",
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
