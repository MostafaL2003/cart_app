import 'package:cart_app/models/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartCubit extends Cubit<List<Products>> {
  final Box _box = Hive.box('cart');

  CartCubit() : super([]) {
    loadCart();
  }

  void loadCart() {
    List<Products> savedItems =
        _box.get('my_simple_cart', defaultValue: []).cast<Products>();

    emit(savedItems);
  }

  void addItem(Products product) {
    final newList = [...state, product];
    emit(newList);

    _box.put('my_simple_cart', newList);
  }

  void removeItem(Products item) {
    final newList = state.where((word) => word != item).toList();
    emit(newList);

    _box.put('my_simple_cart', newList);
  }
}
