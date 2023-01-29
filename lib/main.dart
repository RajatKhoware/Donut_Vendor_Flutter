import 'package:donut_app_ui/pages/addtocart_page.dart';
import 'package:donut_app_ui/pages/order_placed.dart';
import 'package:donut_app_ui/screens/home_page.dart';
import 'package:donut_app_ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donut Applicationss',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        "/home": (context) => const HomePage(),
        "/splash_screen": (context) => const SplashScreen(),
        "/add_to_cart": (context) => const AddToCartPage(),
        "/order_placed": (context) => const OrderPlacedPage(),
      },
    );
  }
}
