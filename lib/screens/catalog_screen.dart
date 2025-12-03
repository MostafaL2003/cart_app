import 'package:cart_app/models/products.dart';
import 'package:cart_app/screens/home_screen.dart';
import 'package:cart_app/screens/order_histor_screen.dart';
import 'package:cart_app/widgets/product_section.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  static List<Products> inventory = [
    Products(
      id: "100",
      name: "Ergonomic Chair",
      price: 350.0,
      image:
          "https://images.unsplash.com/photo-1505843490538-5133c6c7d0e1?auto=format&fit=crop&w=800&q=80",
      description:
          "Designed for 12+ hour workdays. Features adjustable lumbar support, breathable mesh back, and 4D armrests. The perfect throne for coding.",
    ),
    Products(
      id: "101",
      name: "Standing Desk",
      price: 600.0,
      image:
          "https://images.unsplash.com/photo-1595515106969-1ce29566ff1c?auto=format&fit=crop&w=800&q=80",
      description:
          "Solid oak wood top with dual-motor lift system. Go from sitting to standing in 3 seconds. Memory presets included.",
    ),
    Products(
      id: "102",
      name: "Monitor Arm",
      price: 85.0,
      image:
          "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&w=800&q=80",
    ),
    Products(
      id: "103",
      name: "Mechanical Keychron",
      price: 110.0,
      image:
          "https://images.unsplash.com/photo-1595225476474-87563907a212?auto=format&fit=crop&w=800&q=80",
    ),
    Products(
      id: "104",
      name: "Wool Desk Mat (Grey)",
      price: 25.0,

      image:
          "https://images.unsplash.com/photo-1618331835717-801e976710b2?auto=format&fit=crop&w=800&q=80",
    ),
    Products(
      id: "105",
      name: "ScreenBar Light",
      price: 45.0,

      image:
          "https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?auto=format&fit=crop&w=800&q=80",
    ),
  ];
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
      body: ListView(
        padding: const EdgeInsets.only(bottom: 40, top: 20),
        children: [
          ProductSection(title: "Featured Setup", products: inventory),
          const SizedBox(height: 30),
          ProductSection(
            title: "Must-Have Accessories",
            products: inventory.reversed.toList(),
          ),
          const SizedBox(height: 30),
          ProductSection(
            title: "Flash Deals 🔥",
            products: inventory.take(3).toList(),
          ),
        ],
      ),
    );
  }
}
