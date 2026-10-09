import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ministore_pro/models/product.dart';

List<Product> products = [];

Future<void> loadProducts() async {
  final jsonString = await rootBundle.loadString('lib/data/products.json');
  final data = jsonDecode(jsonString);

  products = data.map<Product>((json) => Product.fromJson(json)).toList();
}
