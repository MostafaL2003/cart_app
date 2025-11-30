import 'package:cart_app/cubit/cart_cubit.dart';
import 'package:cart_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  double getTotal(List<Products> items) {
    double total = 0;
    for (var item in items) {
      total = total + (item.price * item.quantity);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Cart-App", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              final newItem = Products(
                id: "101",
                name: "Gaming Monitor",
                price: 22.5,
              );
              context.read<CartCubit>().addItem(newItem);
            },
            child: const Text("Add Item"),
          ),

          Expanded(
            child: BlocBuilder<CartCubit, List<Products>>(
              builder: (context, state) {
                double total = getTotal(state);

                return Column(
                  children: [
                    Expanded(
                      child:
                          state.isEmpty
                              ? const Center(child: Text("Cart is empty"))
                              : ListView.builder(
                                itemCount: state.length,
                                itemBuilder: (context, index) {
                                  final item = state[index];
                                  return ListTile(
                                    title: Text(item.name),
                                    subtitle: Text("\$${item.price}"),
                                    leading: const Icon(Icons.shopping_cart),
                                    trailing: Text("x${item.quantity}"),
                                    onTap:
                                        () => context
                                            .read<CartCubit>()
                                            .removeItem(item),
                                  );
                                },
                              ),
                    ),
                    Container(
                      color: Colors.black12,
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${total.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
