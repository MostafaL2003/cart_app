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
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          item.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.image_not_supported, color: Colors.grey);
          },
        ),
      ),
      trailing: Text("x${item.quantity}"),
      onTap: () => context.read<CartCubit>().removeItem(item),
    );
  }
}
