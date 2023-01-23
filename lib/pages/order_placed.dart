import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderPlacedPage extends StatefulWidget {
  const OrderPlacedPage({super.key});

  @override
  State<OrderPlacedPage> createState() => _OrderPlacedPageState();
}

class _OrderPlacedPageState extends State<OrderPlacedPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    //After animation completed we will back to home page
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushNamed(context, "/home");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      backgroundColor: Colors.black,
      //Showing the animations after order placed
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Lottie.network(
              "https://assets2.lottiefiles.com/packages/lf20_ya7ssbm3.json",
              controller: controller,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Lottie.network(
              "https://assets2.lottiefiles.com/packages/lf20_iadn5gp5IP.json",
              controller: controller,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170, left: 30),
            child: Lottie.network(
              "https://assets8.lottiefiles.com/packages/lf20_ikihxv4x.json",
              controller: controller,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
