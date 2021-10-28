// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather()
    ..weatherDaily = json['Headline'] == null
        ? null
        : WeatherDaily.fromJson(json['Headline'] as Map<String, dynamic>);
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'Headline': instance.weatherDaily,
    };
