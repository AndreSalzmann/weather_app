// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Locations _$LocationsFromJson(List<dynamic> jsons) {
  return Locations()
    ..locations = jsons
        ?.map((e) =>
            e == null ? null : Location.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

List<dynamic> _$LocationsToJson(Locations instance) => <dynamic>[
    instance.locations
  ];

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location()
    ..locationKey = json['Key'] as String
    ..type = json['Type'] as String
    ..name = json['LocalizedName'] as String
    ..postalCode = json['PrimaryPostalCode'] as String
    ..geoPosition = json['GeoPosition'] == null
        ? null
        : GeoPosition.fromJson(json['GeoPosition'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'Key': instance.locationKey,
      'Type': instance.type,
      'LocalizedName': instance.name,
      'PrimaryPostalCode': instance.postalCode,
      'GeoPosition': instance.geoPosition,
    };
