import 'package:flutter/material.dart';
import 'package:weather_app3/pages/home.dart';
import 'package:weather_app3/pages/loading.dart';
import 'package:weather_app3/pages/choose_location.dart';
import 'package:weather_app3/services/PermissionStatus.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => PermissionStatusWidget(),
    '/loading' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));
