import 'package:hive/hive.dart';
import 'package:cart_app/models/products.dart'; // Import your Product model

part 'order.g.dart';

@HiveType(typeId: 1) 
class Order {
  
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final double totalAmount;

  @HiveField(3)
  final List<Products> items; 

  Order({
    required this.id,
    required this.date,
    required this.totalAmount,
    required this.items,
  });
}