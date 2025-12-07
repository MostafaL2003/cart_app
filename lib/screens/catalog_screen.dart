import 'package:cart_app/cubit/catalog_cubit.dart';
import 'package:cart_app/models/products.dart';
import 'package:cart_app/screens/home_screen.dart';
import 'package:cart_app/screens/order_histor_screen.dart';
import 'package:cart_app/widgets/product_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderHistoryScreen(),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(Icons.shop),
          ),
        ],
        backgroundColor: Colors.black,
        title: Text(
          "Catalog",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CatalogCubit, CatalogState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.only(bottom: 40, top: 20),
            children: [
              ProductSection(title: "Featured Setup", products: state.products),
              const SizedBox(height: 30),
              ProductSection(
                title: "Must-Have Accessories",
                products: state.products.reversed.toList(),
              ),
              const SizedBox(height: 30),
              ProductSection(
                title: "Flash Deals 🔥",
                products: state.products.take(3).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
