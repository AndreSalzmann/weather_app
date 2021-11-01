import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/main.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MyHomePage()
        );
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => MyHomePage()
        );
        break;
    }
  }
}