import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int _days = 30;
    String _name = "EleRide";
    bool _isActive = true;
    num _number = 30.5;
    var x = "EleRide";
    const a = 100;
    final b = 200; 

    bringVegitables(thaila: false);
    return MaterialApp(
        //home: HomePage(),
        routes: {
          "/": (context) => LoginPage(),
          "/login": (context) => LoginPage(),
          "/home": (context) => HomePage(),
        }
    );
  }

   bringVegitables ({required bool thaila,int ruppes = 100}) {

  }
}
