import 'package:deliveryapp/App_Images/images.dart';
import 'package:deliveryapp/screens/cubit/cart_cubit.dart';
import 'package:deliveryapp/screens/cubit/cubit_order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            accountName: Text("Flutter Developer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            accountEmail: Text("programmer@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                )),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("${Assets.Avatar}"),
            ),
          ),
        ),
        //list tile
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "homePage");
          },
          child: ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.red),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListTile(
          leading: Icon(CupertinoIcons.person, color: Colors.red),
          title: Text(
            "My Account",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "cartPage");
          },
          child: ListTile(
            leading: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -16, end: -15),
              child: Icon(CupertinoIcons.cart, color: Colors.red),
              badgeContent:
                  Text("${BlocProvider.of<CubitOrderCubit>(context).counter}"),
            ),
            title: Text(
              "My Orders",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "favProducts");
          },
          child: ListTile(
            leading: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -16, end: -15),
              child: Icon(Icons.favorite_border, color: Colors.red),
              badgeContent:
                  Text("${BlocProvider.of<CartCubit>(context).counter}"),
            ),
            title: Text(
              "My Wish List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.red),
          title: Text(
            "Log out",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
