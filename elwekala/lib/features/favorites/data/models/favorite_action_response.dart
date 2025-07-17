// ignore_for_file: overridden_fields

import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/features/favorites/domain/entities/favorite_action_entite.dart';

class FavoriteActionResponse extends FavoriteActionEntite {
  @override
  final String status;
  @override
  final String message;

  FavoriteActionResponse(this.status, this.message)
    : super(status: status, message: message);

  factory FavoriteActionResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteActionResponse(json[ApiKeys.status], json[ApiKeys.message]);
  }

  Map<String, dynamic> toJson() {
    return {ApiKeys.status: status, ApiKeys.message: message};
  }
}
