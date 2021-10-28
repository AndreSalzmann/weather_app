// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoPosition _$GeoPositionFromJson(Map<String, dynamic> json) {
  return GeoPosition()
    ..latitude = (json['Latitude'] as num)?.toDouble()
    ..longitude = (json['Longitude'] as num)?.toDouble();
}

Map<String, dynamic> _$GeoPositionToJson(GeoPosition instance) =>
    <String, dynamic>{
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
    };
