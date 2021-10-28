
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/weather/model/location.dart';
import 'package:weather_app/weather/model/weather.dart';

abstract class WeatherService {
  
  Future<Weather> getWeather({String locationKey});

  Future<Location> getLocation({String locationName});
  
}

class OnlineWeatherService implements WeatherService {

  Dio dio;

  OnlineWeatherService() {
    var options = BaseOptions(
      baseUrl: 'https://dataservice.accuweather.com',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    this.dio = Dio(options);
  }

  @override
  Future<Weather> getWeather({String locationKey}) async {
    final Response <Map<String, dynamic>> response = await
      dio.get('/forecasts/v1/daily/1day/168717?apikey=Uyc554AP2iMWUrnxMpuKVneQ5DMkQnmA&language=de-de');
    
    return Weather.fromJson(response.data);
  }

  @override
  Future<Location> getLocation({String locationName}) async {
    final Response <List<dynamic>> response = await
    dio.get('/locations/v1/de/search?apikey=Uyc554AP2iMWUrnxMpuKVneQ5DMkQnmA&q=$locationName&language=de-de');

    return Location.fromJson(response.data[0]);
  }




  
}