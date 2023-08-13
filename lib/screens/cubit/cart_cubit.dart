import 'package:bloc/bloc.dart';
import 'package:deliveryapp/App_Images/images.dart';
import 'package:deliveryapp/class_details/classDetails.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int counter = 0;
  List<Products> items = [];
  void addCart(Products products) {
    items.add(products);
    emit(CartAddedState());
    counter++;
  }

  void removeCart(Products products) {
    items.remove(products);
    emit(CartDeletedState());
    counter--;
  }

  // bool changeIcon(isClicked) {
  //   return isClicked;
  // }

  // int counter = 0;
  // Map<String, List<Products>> allItems = {
  //   'shop items': [
  //     Products(
  //         name: "Hot Burger",
  //         description: "Taste our Hot Burger",
  //         image: Assets.Burger,
  //         price: "\$100"),
  //     Products(
  //         name: "Hot Pizza",
  //         description: "Taste our Hot Pizza",
  //         image: Assets.Pizza,
  //         price: "\$150"),
  //     Products(
  //         name: "Chicken Biryani",
  //         description: "Taste our Hot Burger",
  //         image: Assets.Biryani,
  //         price: "\$120"),
  //     Products(
  //         name: "Cold Drink",
  //         description: "Taste our Cold Drink",
  //         image: Assets.Drink,
  //         price: "\$20"),
  //     Products(
  //         name: "Chicken Salan",
  //         description: "Taste our Chicken Salan",
  //         image: Assets.Salan,
  //         price: "\$200"),
  //   ],
  //   'cart items': []
  // };
  // void addToCart(item) {
  //   allItems['cart items']!.add(item);
  //   emit(CartAddedState());
  //   counter++;
  // }

  // void deleteFromCart(item) {
  //   allItems['cart items']!.remove(item);
  //   emit(CartDeletedState());
  //   counter--;
  // }
}
