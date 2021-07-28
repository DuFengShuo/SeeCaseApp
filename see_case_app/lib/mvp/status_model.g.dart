// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) {
  return StatusModel(
    message: json['message'] as String?,
    status: json['status'] as int?,
    favoriteCount: json['favorite_count'] as int?,
  );
}

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'favorite_count': instance.favoriteCount,
    };
