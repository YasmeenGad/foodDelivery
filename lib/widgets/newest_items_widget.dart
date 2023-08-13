import 'package:deliveryapp/App_Images/images.dart';
import 'package:deliveryapp/class_details/classDetails.dart';
import 'package:deliveryapp/screens/cubit/cart_cubit.dart';
import 'package:deliveryapp/screens/cubit/cubit_order_cubit.dart';
import 'package:deliveryapp/screens/item_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewestItemsWidget extends StatelessWidget {
  const NewestItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget newestItems(
        {required String image,
        required String title,
        required String description,
        required String price}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: width / 1.1,
          height: height / 5,
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
          child: Row(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemPage(
                            image: image,
                            name: title,
                            description: description,
                            price: price)));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  image,
                  height: height / 4,
                  width: width / 3,
                ),
              ),
            ),
            Container(
              width: width / 2.4,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 18,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.redAccent),
                      onRatingUpdate: (index) {},
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        BlocProvider.of<CartCubit>(context).addCart(Products(
                            name: title,
                            description: description,
                            image: image,
                            price: price));
                      },
                      child: Icon(Icons.favorite_border,
                          color: Colors.red, size: 28)),
                  InkWell(
                      onTap: () {
                        BlocProvider.of<CubitOrderCubit>(context).orderCart(
                            Products(
                                name: title,
                                description: description,
                                image: image,
                                price: price));
                      },
                      child: Icon(CupertinoIcons.cart,
                          color: Colors.red, size: 28))
                ],
              ),
            )
          ]),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(children: [
          newestItems(
              title: "Hot Pizza",
              description: "Taste hot pizza. we provide our great food",
              price: "\$100",
              image: '${Assets.Pizza}'),
          newestItems(
              title: "Hot Burger",
              description: "Taste hot Burger. we provide our great food",
              price: "\$30",
              image: '${Assets.Burger}'),
          newestItems(
              title: "Cold Drink",
              description: "Taste cold drink. we provide our great food",
              price: "\$20",
              image: '${Assets.Drink}'),
          newestItems(
              title: "Chicken Biryani",
              description: "Taste Chicken Biryani. we provide our great food",
              price: "\$100",
              image: '${Assets.Biryani}'),
          newestItems(
              title: "Chicken Salan",
              description: "Taste Chicken Salan. we provide our great food",
              price: "\$120",
              image: '${Assets.Salan}'),
        ]),
      ),
    );
  }
}
