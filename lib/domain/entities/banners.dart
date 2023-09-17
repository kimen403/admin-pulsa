import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  final String id;
  final String imageUrl;
  final String description;
  final String createdAt;
  final String updatedAt;

  Banners({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, imageUrl, description, createdAt, updatedAt];
}
