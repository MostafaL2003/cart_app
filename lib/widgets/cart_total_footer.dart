import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartTotalFooter extends StatelessWidget {
  final double total;
  const CartTotalFooter({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    );
  }
}