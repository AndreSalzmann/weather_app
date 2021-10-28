import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/weather/model/geo_position.dart';

part 'location.g.dart';

@JsonSerializable()
class Locations {

  Locations();

  factory Locations.fromJson(List<dynamic> jsons) =>
      _$LocationsFromJson(jsons);

  List<Location> locations;

  List<dynamic> toJson() => _$LocationsToJson(this);

}

@JsonSerializable()
class Location {

  Location();

  factory Location.fromJson(Map<String, dynamic> json) =>
    _$LocationFromJson(json);

  String locationKey;
  String type;
  String name;
  String postalCode;
  GeoPosition geoPosition;

  Map<String, dynamic> toJson() => _$LocationToJson(this);

}