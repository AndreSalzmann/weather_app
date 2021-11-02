import 'package:flutter/material.dart';
import 'package:weather_app/weather/bloc/weather_bloc.dart';

class WeatherSearchScreen extends StatefulWidget {
  const WeatherSearchScreen({Key key}) : super(key: key);

  @override
  _WeatherSearchScreenState createState() => _WeatherSearchScreenState();
}

class _WeatherSearchScreenState extends State<WeatherSearchScreen> {

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Das Wetter in deiner Gegend."),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (String text) {
                  print(text);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search)
                ),
                controller: _controller,
                onSubmitted: (String value) {
                  Navigator.pushNamed(context, '/weather');
                  WeatherBloc.of(context).add(GetWeatherLocationEvent(value));
                },
              ),
            ],
          ),
        ),
      ),
    );;
  }
}

