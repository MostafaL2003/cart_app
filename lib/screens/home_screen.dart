import 'package:cart_app/cubit/cart_cubit.dart';
import 'package:cart_app/models/products.dart';
import 'package:cart_app/widgets/cart_list_tile.dart';
import 'package:cart_app/widgets/cart_total_footer.dart';
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
                                  return CartListTile(item: item);
                                },
                              ),
                    ),
                    CartTotalFooter(total: total),
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
