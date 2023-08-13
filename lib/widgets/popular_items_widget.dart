import 'package:deliveryapp/App_Images/images.dart';
import 'package:deliveryapp/class_details/classDetails.dart';
import 'package:deliveryapp/screens/cubit/cart_cubit.dart';
import 'package:deliveryapp/screens/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularItemsWidget extends StatelessWidget {
  const PopularItemsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget popularItems({
      required String image,
      required String itemName,
      required String itemName2,
      required String price,
    }) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemPage(
                      image: image,
                      name: itemName,
                      description: itemName2,
                      price: price)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Container(
            width: width / 2.2,
            height: height / 4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        "${image}",
                        height: height / 11,
                      ),
                    ),
                    Text(
                      itemName,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      itemName2,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(price,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<CartCubit>(context).addCart(
                                Products(
                                    name: itemName,
                                    description: itemName2,
                                    image: image,
                                    price: price));
                          },
                          child: Icon(Icons.favorite_border,
                              color: Colors.red, size: 26),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(children: [
          popularItems(
              image: Assets.Burger,
              itemName: "Hot Burger",
              itemName2: "Taste our hot burger",
              price: "\$30"),
          popularItems(
              image: Assets.Biryani,
              itemName: "Chicken Biryani",
              itemName2: "Chicken Biryan",
              price: "\$85"),
          popularItems(
              image: Assets.Drink,
              itemName: "Cold Drink",
              itemName2: "Taste cold drink",
              price: "\$20"),
          popularItems(
              image: Assets.Pizza,
              itemName: "Hot Pizza",
              itemName2: "Taste our hot Pizza",
              price: "\$100"),
          popularItems(
              image: Assets.Salan,
              itemName: "Chicken Salan",
              itemName2: "Taste Chicken Salan",
              price: "\$150"),
        ]),
      ),
    );
  }
}
