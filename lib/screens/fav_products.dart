import 'package:deliveryapp/screens/cubit/cart_cubit.dart';
import 'package:deliveryapp/widgets/app_bar_widget.dart';
import 'package:deliveryapp/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavProducts extends StatelessWidget {
  const FavProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarWidget(),
              BlocConsumer<CartCubit, CartState>(builder: (context, state) {
                if (state is CartAddedState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Favorite Products",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              BlocProvider.of<CartCubit>(context).items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: width / 1.1,
                                    height: height / 5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(0, 3))
                                        ]),
                                    child: Row(children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          child: Image.asset(
                                            "${BlocProvider.of<CartCubit>(context).items[index].image}",
                                            height: height / 4,
                                            width: width / 3,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: width / 2.4,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "${BlocProvider.of<CartCubit>(context).items[index].name}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${BlocProvider.of<CartCubit>(context).items[index].description}",
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
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                itemBuilder: (context, _) =>
                                                    Icon(Icons.star,
                                                        color:
                                                            Colors.redAccent),
                                                onRatingUpdate: (index) {},
                                              ),
                                              Text(
                                                "${BlocProvider.of<CartCubit>(context).items[index].price}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(CupertinoIcons.cart,
                                                color: Colors.red, size: 28)
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ]),
                            );
                          }),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "You don't have favorite products !",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }
              }, listener: (context, state) {
                if (state is CartAddedState) {
                  final snackBar = SnackBar(
                      content:
                          Text("Cart is added successfully as a favorite"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              })
            ],
          ),
        ),
        drawer: DrawerWidget(),
      ),
    );
  }
}
