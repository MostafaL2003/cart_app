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

  Products({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.image
  });

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
