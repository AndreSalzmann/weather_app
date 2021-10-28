
import 'package:json_annotation/json_annotation.dart';

part 'geo_position.g.dart';

@JsonSerializable()
class GeoPosition {

  GeoPosition();

  factory GeoPosition.fromJson(Map<String, dynamic> json) =>
    _$GeoPositionFromJson(json);

  double latitude;
  double longitude;

  Map<String, dynamic> toJson() => _$GeoPositionToJson(this);

}