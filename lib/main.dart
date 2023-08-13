import 'package:deliveryapp/screens/cubit/cart_cubit.dart';
import 'package:deliveryapp/screens/cubit/cubit_order_cubit.dart';
import 'package:deliveryapp/screens/fav_products.dart';
import 'package:deliveryapp/screens/home_page.dart';
import 'package:deliveryapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/cart_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(create: (context) => CubitOrderCubit()),
      ],
      child: MaterialApp(
          title: "Food App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFF5F5F3),
          ),
          routes: {
            "/": (context) => WelcomeScreen(),
            "homePage": (context) => HomePage(),
            "cartPage": (context) => CartPage(),
            "favProducts": (context) => FavProducts(),
          }),
    );
  }
}
