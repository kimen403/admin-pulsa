import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/domain/entities/banners.dart';

class BannerModel extends Equatable {
  final String id;
  final String imageUrl;
  final String description;
  final String createdAt;
  final String updatedAt;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BannerModel.fromRawJson(String str) =>
      BannerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        imageUrl: json["image_url"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  Banners toEntity() => Banners(
        id: id,
        imageUrl: imageUrl,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [id, imageUrl, description, createdAt, updatedAt];
}
