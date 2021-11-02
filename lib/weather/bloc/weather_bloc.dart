import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/service_locator.dart';
import 'package:weather_app/weather/model/location.dart';
import 'package:weather_app/weather/model/weather.dart';
import 'package:weather_app/weather/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  Weather weather;

  Location location;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    print("Event Triggered");
    yield* event.applyAsync(bloc: this);
  }

  static WeatherBloc of(BuildContext context) =>
      BlocProvider.of<WeatherBloc>(context);

  @override
  Future<Function> close() async {
    await super.close();
  }
}
