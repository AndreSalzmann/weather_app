import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/search_history/search_history_screen.dart';
import 'package:weather_app/weather/screen/weather_result_screen.dart';
import 'package:weather_app/weather/screen/weather_search_screen.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => WeatherSearchScreen()
        );
        break;
      case '/weather':
        return MaterialPageRoute(
          builder: (_) => WeatherResultScreen()
        );
        break;
      case '/searches':
        return MaterialPageRoute(
          builder: (_) => SearchHistoryScreen()
        );
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => WeatherSearchScreen()
        );
        break;
    }
  }
}