import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  final _formKey = GlobalKey<FormState>(); 
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              Text(
                "Login",
                // "Login $name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Username", hintText: "Enter Username"),
                          validator: (val) {
                            if(val == null || val.isEmpty){
                              return "Username cannot be empty";
                              }
                            if(val.length < 3){
                              return "Username length should be atleast 3";
                            }
                          },
                          onChanged: (val) =>{ 
                            name = val,
                            setState(() {})},
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", hintText: "Enter Password"),
                          validator: (val) {
                            if(val == null || val.isEmpty){
                              return "Password cannot be empty";
                              }
                            if(val.length < 6){
                              return "Password length should be atleast 6";
                            }
                        // Regular expression for password validation
                        RegExp regex = RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
                        if (!regex.hasMatch(val)) {
                          return "Password must contain at least one uppercase letter, one lowercase letter, and one special character";
                        }
                          },
                    ),
                    SizedBox(height: 40, width: 20),
                    ElevatedButton(
                        onPressed: () => login(),
                        style:
                            ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            minimumSize: Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            foregroundColor: Colors.white),
                            
                            
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20, width: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, MyRoutes.signUpRoute),
                            child: Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)))
                      ],
                    )
                  ]),
                ),
              )
            ],
          ),
        ));
  }

  login() {
    if(_formKey.currentState!.validate()) Navigator.pushNamed(context, MyRoutes.homeRoute);
  }
}
