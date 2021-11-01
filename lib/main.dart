import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/service_locator.dart';
import 'package:weather_app/weather/bloc/weather_bloc.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
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
                controller: _controller,
                onSubmitted: (String value) async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Thanks!"),
                        content: Text('You typed "$value", which has length ${value.characters.length}.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              BlocProvider.of<WeatherBloc>(context)
                                ..add(GetWeatherLocationEvent(value));
                            },
                            child: const Text('Ok'),
                          )
                        ],
                      );
                    }
                  );
                },
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  final WeatherBloc bloc = BlocProvider.of<WeatherBloc>(context);
                  if(state is WeatherLoaded) {
                    String weatherText = bloc.weather.weatherDaily.text;
                    String cityName = bloc.location.name;
                    return Column(
                      children: [
                        Text('$weatherText'),
                        Text('Stadt: $cityName')
                      ],
                    );
                  } else if (state is WeatherLoading) {
                    return const Text("Wird geladen..");
                  }
                  else if (state is WeatherError) {
                    return const Text("Es ist ein Fehler aufgetreten");
                  }
                  else if (state is WeatherLocationNotFound) {
                    return const Text("Es wurde keine passende Lokation gefunden.");
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
