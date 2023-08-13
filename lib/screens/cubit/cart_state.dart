part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartAddedState extends CartState {}

class CartDeletedState extends CartState {}
