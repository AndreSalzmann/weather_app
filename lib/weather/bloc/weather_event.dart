part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  Stream<WeatherState> applyAsync({
    WeatherBloc bloc,
  });
}

class GetWeatherEvent extends WeatherEvent {

  GetWeatherEvent({@required this.locationKey});

  final String locationKey;

  @override
  Stream<WeatherState> applyAsync({WeatherBloc bloc}) async* {
    yield WeatherLoading();
    Weather weather = await OnlineWeatherService().getWeather(locationKey: locationKey);
    if (weather != null) {
      bloc.weather = weather;
      yield WeatherLoaded();
    } else {
      yield WeatherError();
    }
  }

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class GetWeatherLocationEvent extends WeatherEvent {

  final String value;

  GetWeatherLocationEvent(this.value);

  @override
  Stream<WeatherState> applyAsync({WeatherBloc bloc}) async* {
    yield WeatherLoading();
    Location location = await app<OnlineWeatherService>()
      .getLocation(locationName: value);
    if(location != null) {
      bloc.location = location;
      Weather weather = await app<OnlineWeatherService>()
          .getWeather(locationKey: location.locationKey);
      if(weather != null) {
        bloc.weather = weather;
        yield WeatherLoaded(weather: weather);
      }
    } else {
      yield WeatherLocationNotFound();
    }
  }

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}