import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
           Padding(padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
           child: Form(
            key: _formKey,
             child: Column(
              children: [
                Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Email",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter Username",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                      ),
                    )
              ],
             ),
           ),),
          ],
        ),
      ),
    );
  }
}