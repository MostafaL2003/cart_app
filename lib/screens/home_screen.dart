import 'package:cart_app/cubit/cart_cubit.dart';
import 'package:cart_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This helper function is perfect. Keep it.
  double getTotal(List<Products> items) {
    double total = 0;
    for (var item in items) {
      total = total + item.price;
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
          // 1. Button (Does not need to listen to state, so it can stay outside)
          ElevatedButton(
            onPressed: () {
              final newItem = Products(
                id: DateTime.now().toString(),
                name: "Gaming Monitor",
                price: 22.5,
              );
              context.read<CartCubit>().addItem(newItem);
            },
            child: const Text("Add Item"),
          ),

          // 2. THE BIG CHANGE: The Builder now wraps EVERYTHING below the button
          Expanded(
            child: BlocBuilder<CartCubit, List<Products>>(
              builder: (context, state) {
                
                // NOW we have access to 'state', so we can calculate total
                double total = getTotal(state);

                return Column(
                  children: [
                    // A. The List (Needs Expanded to scroll)
                    Expanded(
                      child: state.isEmpty
                          ? const Center(child: Text("Cart is empty"))
                          : ListView.builder(
                              itemCount: state.length,
                              itemBuilder: (context, index) {
                                final item = state[index];
                                return ListTile(
                                  title: Text(item.name),
                                  subtitle: Text("\$${item.price}"),
                                  leading: const Icon(Icons.shopping_cart),
                                  onTap: () => context.read<CartCubit>().removeItem(item),
                                );
                              },
                            ),
                    ),

                    // B. The Footer (Now it can see 'total'!)
                    Container(
                      color: Colors.black12, // Added color to see it better
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(
                            "\$${total.toStringAsFixed(2)}", // Format nicely
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
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