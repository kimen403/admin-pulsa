import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:panel_admin_pulsa/data/models/banner/banner_model.dart';

class BannerResponseModel extends Equatable {
  final String status;
  final List<BannerModel> banner;

  BannerResponseModel({
    required this.status,
    required this.banner,
  });

  factory BannerResponseModel.fromRawJson(String str) =>
      BannerResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerResponseModel.fromJson(Map<String, dynamic> json) =>
      BannerResponseModel(
        status: json["status"],
        banner: List<BannerModel>.from(
            json["banner"].map((x) => BannerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [status, banner];
}
