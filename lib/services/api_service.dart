import 'package:cart_app/models/products.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Products>> getProducts() async {
    try {
      final response = await _dio.get("https://fakestoreapi.com/products");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        List<Products> products =
            data.map((item) => Products.fromJson(item)).toList();
        return products;
      }
      return [];
    } catch (e) {
      print("Error Catching${e}");
      return [];
    }
  }
}
