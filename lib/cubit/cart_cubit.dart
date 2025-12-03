import 'package:cart_app/models/order.dart';
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
    final int index = state.indexWhere((item) => item.id == product.id);
    final List<Products> newList = List.of(state);

    if (index != -1) {
      final oldItem = newList[index];
      final updatedItem = oldItem.copyWith(quantity: oldItem.quantity + 1);
      newList[index] = updatedItem;
    } else {
      newList.add(product);
    }
    emit(newList);

    _box.put('my_simple_cart', newList);
  }

  void removeItem(Products product) {
    final int index = state.indexWhere((item) => item.id == product.id);

    if (index == -1) return;

    final List<Products> newList = List.of(state);
    final existingItem = newList[index];

    if (existingItem.quantity > 1) {
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity - 1,
      );
      newList[index] = updatedItem;
    } else {
      newList.removeAt(index);
    }

    emit(newList);
    _box.put('my_simple_cart', newList);
  }

  void submitOrder(double totalAmount) {
    final order = Order(
      id: DateTime.now().toString(),
      date: DateTime.now(),
      items: List.of(state),
      totalAmount: totalAmount,
    );

    final orderBox = Hive.box('orders');
    orderBox.add(order);

    final List<Products> emptyList = [];
    emit(emptyList);
    _box.put('my_simple_cart', emptyList);
  }
}
