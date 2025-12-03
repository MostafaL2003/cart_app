import 'package:cart_app/models/order.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; 

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Past Orders", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('orders').listenable(),
        builder: (context, Box box, _) {
          if (box.isEmpty) {
            return const Center(child: Text("No past orders yet."));
          }


          final orders = box.values.toList().cast<Order>().reversed.toList();

          return ListView.builder(
            itemCount: orders.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  title: Text("Order #${order.id.substring(0, 5)}..."), 
                  subtitle: Text(
                    "${order.items.length} items • \$${order.totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ...order.items.map((item) => ListTile(
                      title: Text(item.name),
                      trailing: Text("x${item.quantity}"),
                    )),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}