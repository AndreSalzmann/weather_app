import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/service_locator.dart';
import 'package:weather_app/weather/bloc/weather_bloc.dart';
import 'package:weather_app/weather/screen/weather_search_screen.dart';

import 'navigation/navigation.dart';

void main() {
  setupServices();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));

}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    Key key,
    @required this.appRouter
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        onGenerateRoute: appRouter.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
      ),
    );
  }
}
