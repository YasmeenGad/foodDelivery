import 'package:deliveryapp/screens/cubit/cart_cubit.dart';
import 'package:deliveryapp/screens/cubit/cubit_order_cubit.dart';
import 'package:deliveryapp/widgets/app_bar_widget.dart';
import 'package:deliveryapp/widgets/category_widget.dart';
import 'package:deliveryapp/widgets/drawer_widget.dart';
import 'package:deliveryapp/widgets/newest_items_widget.dart';
import 'package:deliveryapp/widgets/popular_items_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            // AppBar Widget
            AppBarWidget(),
            // search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: height / 14,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3))
                    ]),
                child: Row(children: [
                  Icon(CupertinoIcons.search, color: Colors.red),
                  Container(
                    height: height / 14,
                    width: width / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What would you like to have?",
                            hintStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.filter_list),
                ]),
              ),
            ),
            //Category
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text("Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            //Category Widget
            CategoryWidget(),
            //popular items
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text("Popular",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            //popular items Widget
            PopularItemsWidget(),

            //newest items
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text("Newest",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),

            //newest items widget
            NewestItemsWidget(),
          ],
        ),
        // Drawer Widget
        drawer: DrawerWidget(),
        //floating action button
        floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 3))
              ]),
          child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "cartPage");
              },
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -20, end: -10),
                badgeContent: Text(
                    "${BlocProvider.of<CubitOrderCubit>(context).counter}"),
                child: Icon(CupertinoIcons.cart, color: Colors.red, size: 28),
              )),
        ),
      ),
    );
  }
}
