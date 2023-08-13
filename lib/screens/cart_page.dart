import 'package:deliveryapp/App_Images/images.dart';
import 'package:deliveryapp/screens/cubit/cubit_order_cubit.dart';
import 'package:deliveryapp/widgets/app_bar_widget.dart';
import 'package:deliveryapp/widgets/cart_bottom_nav_bar.dart';
import 'package:deliveryapp/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            AppBarWidget(),
            BlocConsumer<CubitOrderCubit, CubitOrderState>(
                builder: (context, state) {
              if (state is CubitOrderSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, bottom: 10),
                      child: Text(
                        "Order List",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: BlocProvider.of<CubitOrderCubit>(context)
                            .orders
                            .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Container(
                              width: width / 1.05,
                              height: height / 8,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: Offset(0, 3))
                                  ]),
                              child: Row(children: [
                                Container(
                                    padding: EdgeInsets.all(12),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "${BlocProvider.of<CubitOrderCubit>(context).orders[index].image}",
                                      width: width / 4,
                                      height: height / 7,
                                    )),
                                Container(
                                  width: width / 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          "${BlocProvider.of<CubitOrderCubit>(context).orders[index].name}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          "${BlocProvider.of<CubitOrderCubit>(context).orders[index].description}",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(
                                          "${BlocProvider.of<CubitOrderCubit>(context).orders[index].price}",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.red)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: width / 9.5,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(CupertinoIcons.minus,
                                            color: Colors.white),
                                        Text("2",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Icon(CupertinoIcons.add,
                                            color: Colors.white),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Items: ",
                                      style: TextStyle(fontSize: 20)),
                                  Text(
                                      "${BlocProvider.of<CubitOrderCubit>(context).counter}",
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("sub-total Price: ",
                                      style: TextStyle(fontSize: 20)),
                                  Text(
                                      "${BlocProvider.of<CubitOrderCubit>(context).orders[0].price}",
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery: ",
                                      style: TextStyle(fontSize: 20)),
                                  Text("\$20", style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Price: ",
                                      style: TextStyle(fontSize: 20)),
                                  Text("\$120",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: Text("You have not buy any order !",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                );
              }
            }, listener: (context, state) {
              if (state is CubitOrderSuccess) {
                final snackBar = SnackBar(
                    content: Text("you ordered this product successfully"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            })
          ]),
        ),
        bottomNavigationBar: CartBottomNavBar(),
        drawer: DrawerWidget(),
      ),
    );
  }
}
