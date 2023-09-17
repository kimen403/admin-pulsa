import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:panel_admin_pulsa/domain/entities/product.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final int basePrice;
  final int vipPrice;
  final int price;
  final String category;
  final String provider;
  final String code;
  final String formType;
  final bool status;
  final String desc;

  ProductModel({
    required this.id,
    required this.name,
    required this.basePrice,
    required this.vipPrice,
    required this.price,
    required this.category,
    required this.provider,
    required this.code,
    required this.formType,
    required this.status,
    required this.desc,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        basePrice: json["base_price"],
        vipPrice: json["vip_price"],
        price: json["price"],
        category: json["category"],
        provider: json["provider"],
        code: json["code"],
        formType: json["form_type"],
        status: json["status"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "base_price": basePrice,
        "vip_price": vipPrice,
        "price": price,
        "category": category,
        "provider": provider,
        "code": code,
        "form_type": formType,
        "status": status,
        "desc": desc,
      };

  Product toEntity() {
    return Product(
      id: this.id,
      name: this.name,
      basePrice: this.basePrice,
      vipPrice: this.vipPrice,
      price: this.price,
      category: this.category,
      provider: this.provider,
      code: this.code,
      formType: this.formType,
      status: this.status,
      desc: this.desc,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        basePrice,
        vipPrice,
        price,
        category,
        provider,
        code,
        formType,
        status,
        desc,
      ];
}
