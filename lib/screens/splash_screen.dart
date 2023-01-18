import 'package:donut_app_ui/screens/home_page.dart';
import 'package:donut_app_ui/utils/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffbbd8),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 100),
              child: SizedBox(
                width: 400,
                height: 300,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3.0,
                              color: const Color.fromARGB(10, 0, 0, 0),
                              style: BorderStyle.solid),
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            center: Alignment.center,
                            radius: 1.2,
                            colors: [
                              Color(0xFFffbbd8),
                              Color.fromARGB(255, 246, 143, 170),
                            ],
                          ),
                        ),
                        child: Lottie.network(
                          "https://assets9.lottiefiles.com/private_files/lf30_rfnappr0.json",
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 130, left: 5),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white38,
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 130, left: 295),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white38,
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            CupertinoIcons.forward,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 20,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(60),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(33, 0, 0, 0),
                    offset: Offset(0, 30),
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            const CustomFont(
                text: "   We Have\nSpecial Food",
                fontSize: 40,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.w900),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                width: 180,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 20),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: const Center(
                  child: CustomFont(
                      text: "Let's Explore",
                      fontSize: 20,
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
