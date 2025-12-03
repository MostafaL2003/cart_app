import 'package:cart_app/models/products.dart';
import 'package:cart_app/widgets/catalog_product_card.dart'; // Import your card
import 'package:flutter/material.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<Products> products;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text("See All", style: TextStyle(color: Colors.blueAccent)),
            ],
          ),
        ),

        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              final product = products[index];

              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 10),
                child: CatalogProductCard(product: product),
              );
            },
          ),
        ),
      ],
    );
  }
}
