import 'package:hive/hive.dart';
part 'products.g.dart';

@HiveType(typeId: 0)
class Products {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final String description;

  Products({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.image,
    this.description = "No description available",
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'].toString(),
      name: json['title'] ?? 'No Name',
      price: (json['price'] as num).toDouble(),
      image: json['image'] ?? '',
      description: json['description'] ?? 'No Description',
      quantity: 1,
    );
  }

  Products copyWith({String? id, String? name, double? price, int? quantity}) {
    return Products(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
    );
  }


}
