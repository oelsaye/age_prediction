import 'package:age_prediction/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
  },
));
