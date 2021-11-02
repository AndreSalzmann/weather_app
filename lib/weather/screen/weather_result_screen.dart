import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/bloc/weather_bloc.dart';
import 'package:weather_app/weather/model/location.dart';
import 'package:weather_app/weather/model/weather.dart';

class WeatherResultScreen extends StatelessWidget {
  const WeatherResultScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather in your City"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blueAccent,
                Colors.lightBlue
              ]
            )
          ),
          padding: EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {

                    Weather _weather = WeatherBloc.of(context).weather;
                    Location _location = WeatherBloc.of(context).location;

                    if(state is WeatherLoaded) {
                      String weatherText = _weather.weatherDaily.text;
                      String cityName = _location.name;
                      return Column(
                        children: [
                          Text('$weatherText', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          Text('Stadt: $cityName', style: TextStyle(fontSize: 16),)
                        ],
                      );
                    }

                    if (state is WeatherLoading) {
                      return const Text("Wird geladen..");
                    }

                    if (state is WeatherError) {
                      return const Text("Es ist ein Fehler aufgetreten");
                    }

                    if (state is WeatherLocationNotFound) {
                      return const Text("Es wurde keine passende Lokation gefunden.");
                    }

                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
