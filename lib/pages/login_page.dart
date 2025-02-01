import 'dart:math';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username", hintText: "Enter Username"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "Enter Password"),
                ),
                SizedBox(height: 20, width: 20),
                ElevatedButton(
                  onPressed: () => Login(), 
                  child: Text("Login",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    foregroundColor: Colors.white
                  )
                  )
              ]),
            )
          ],
        ));
  }

  Login() {
    print("Login");
  }
}
