import 'package:bloc/bloc.dart';
import 'package:deliveryapp/class_details/classDetails.dart';
import 'package:meta/meta.dart';

part 'cubit_order_state.dart';

class CubitOrderCubit extends Cubit<CubitOrderState> {
  CubitOrderCubit() : super(CubitOrderInitial());
  int counter = 0;
  List<Products> orders = [];
  void orderCart(Products products) {
    orders.add(products);
    emit(CubitOrderSuccess());
    counter++;
  }
}
