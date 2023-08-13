import 'package:deliveryapp/App_Images/images.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});
  Widget images({required String image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          "${image}",
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: [
              images(image: Assets.Drink),
              images(image: Assets.Salan),
              images(image: Assets.Biryani),
              images(image: Assets.Pizza),
              images(image: Assets.Burger),
              images(image: Assets.Pizza),
              images(image: Assets.Biryani),
            ],
          ),
        ));
  }
}
