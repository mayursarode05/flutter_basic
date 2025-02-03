import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/signup_page.dart';
import './utils/routes.dart';

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
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lora().fontFamily,
        ),
        routes: {
          "/": (context) => LoginPage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.signUpRoute: (context) => SignUp(),
        }
    );
  }

   bringVegitables ({required bool thaila,int ruppes = 100}) {
    
  }
}
