import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/weather/model/weather_daily.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {

  Weather();

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson( json);

  WeatherDaily weatherDaily;

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}