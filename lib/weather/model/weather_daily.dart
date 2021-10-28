import 'package:json_annotation/json_annotation.dart';

part 'weather_daily.g.dart';

@JsonSerializable()
class WeatherDaily {

  WeatherDaily();

  factory WeatherDaily.fromJson(Map<String, dynamic> json) =>
    _$WeatherDailyFromJson(json);

  String type;
  int category;
  String text;

  Map<String, dynamic> toJson() => _$WeatherDailyToJson(this);

}