part of 'weather_bloc.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({Weather weather});
}

class WeatherLocationNotFound extends WeatherState {}

class WeatherError extends WeatherState {}
