import 'package:equatable/equatable.dart';

class Product extends Equatable {
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

  Product({
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
