import 'package:deliveryapp/App_Images/images.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Image.asset("${Assets.Boy}"),
        SizedBox(
          height: 5,
        ),
        Text(
          "Order Your Food Now!",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            "Order food and get delivery within a few minutes to your door",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black45),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "homePage");
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: Color(0xFFFF2508),
                borderRadius: BorderRadius.circular(30)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Get Started",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20)
            ]),
          ),
        )
      ]),
    ));
  }
}
