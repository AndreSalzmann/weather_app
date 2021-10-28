// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDaily _$WeatherDailyFromJson(Map<String, dynamic> json) {
  return WeatherDaily()
    ..type = json['Category'] as String
    ..category = json['Severity'] as int
    ..text = json['Text'] as String;
}

Map<String, dynamic> _$WeatherDailyToJson(WeatherDaily instance) =>
    <String, dynamic>{
      'Category': instance.type,
      'Severity': instance.category,
      'Text': instance.text,
    };
