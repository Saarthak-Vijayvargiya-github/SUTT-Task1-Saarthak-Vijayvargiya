import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app3/services/location_service.dart';
import 'package:weather_app3/services/models.dart';


class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

@override

class _LoadingState extends State<Loading> {

  void getWeather() async{
    GetLocationData instance = GetLocationData();
    await instance.getCurrentLocation();
    print(instance.longitude);
    print(instance.latitude);
    WeatherResponse instance2 = await DataService2().dataService2(instance.latitude, instance.longitude);
    // print(instance2.cityName);
    // print(instance2.tempInfo.currTemp);
    // print(instance2.tempInfo.feelslike);
    // print(instance2.tempInfo.tempmax);
    // print(instance2.tempInfo.tempmin);
    // print(instance2.weatherInfo.description);
    // print(instance2.weatherInfo.icon);
    Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'cityName': instance2.cityName,
      'currTemp': instance2.tempInfo.currTemp,
      'feelslike': instance2.tempInfo.feelslike,
      'tempmax': instance2.tempInfo.tempmax,
      'tempmin': instance2.tempInfo.tempmin,
      'pressure': instance2.tempInfo.pressure,
      'humidity': instance2.tempInfo.humidity,
      'description': instance2.weatherInfo.description,
      'icon': instance2.weatherInfo.icon,
    });
  }
  @override
  void initState() {
    super.initState();
    getWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.yellow,
          size: 100.0,
          // duration: Duration(seconds: 3),
        ),
      ),
    );
  }
}