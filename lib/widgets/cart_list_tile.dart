import 'package:cart_app/cubit/cart_cubit.dart';
import 'package:cart_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListTile extends StatelessWidget {
  final Products item;
  const CartListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text("\$${item.price}"),
      leading: const Icon(Icons.shopping_cart),
      trailing: Text("x${item.quantity}"),
      onTap: () => context.read<CartCubit>().removeItem(item),
    );
    
  }
}
