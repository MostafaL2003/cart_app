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

  Products({required this.id, required this.name, required this.price});
}
