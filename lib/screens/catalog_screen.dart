import 'package:cart_app/models/products.dart';
import 'package:cart_app/screens/home_screen.dart';
import 'package:cart_app/widgets/catalog_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  static List<Products> inventory = [
    Products(id: "100", name: "Mouse", price: 80),
    Products(id: "101", name: "Monitor", price: 200),
    Products(id: "102", name: "Keyboard", price: 120),
    Products(id: "103", name: "Mouse Pad", price: 30),
    Products(id: "104", name: "Headset", price: 150),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),

          itemCount: inventory.length,
          itemBuilder: (context, index) {
            final product = inventory[index];

            return CatalogProductCard(product: product);
          },
        ),
      ),
    );
  }
}
