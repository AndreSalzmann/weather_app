
import 'package:get_it/get_it.dart';
import 'package:weather_app/weather/weather_service.dart';

final GetIt app = GetIt.instance;

void setupServices() {
  app
    ..registerSingleton<OnlineWeatherService>(OnlineWeatherService());
}