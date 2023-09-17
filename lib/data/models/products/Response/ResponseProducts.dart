import 'dart:convert';

import 'ProductModel.dart';

class ProductsResponse {
  final String status;
  final List<ProductModel> products;

  ProductsResponse({
    required this.status,
    required this.products,
  });

  factory ProductsResponse.fromRawJson(String str) =>
      ProductsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        status: json["status"],
        products: List<ProductModel>.from(
            json["products"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
