import 'package:cart_app/cubit/cart_cubit.dart';
import 'package:cart_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final Products product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Transparent AppBar so image goes to top
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. BIG IMAGE (With Hero Animation)
          Expanded(
            flex: 5, // Takes up top 50%
            child: Hero(
              tag: product.id, // Must match the tag in the Catalog Card
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F7),
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // 2. DETAILS SECTION
          Expanded(
            flex: 4, // Takes up bottom 40%
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  
                  // Price
                  Text(
                    "\$${product.price}",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.w600),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Description Label
                  const Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  
                  // Actual Description
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.grey, height: 1.5),
                  ),

                  const Spacer(),

                  // ADD TO CART BUTTON (Big & Wide)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {
                        context.read<CartCubit>().addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${product.name} added!")),
                        );
                        Navigator.pop(context); // Go back after adding
                      },
                      child: const Text("Add to Cart", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}