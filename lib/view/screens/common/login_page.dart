import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
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
                          prefixIcon: Icon(Icons.person_2_rounded),
                          labelText: "Username",
                          hintText: "Enter Username"),
                      controller: _userNameController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Username cannot be empty";
                        }
                        if (val.length < 3) {
                          return "Username length should be atleast 3";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                          _formKey.currentState!.validate();
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          hintText: "Enter Password"),
                      controller: _passwordController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (val.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        // Regular expression for password validation
                        RegExp regex = RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
                        if (!regex.hasMatch(val)) {
                          return "Password must contain at least one uppercase letter, one lowercase letter, and one special character";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                          _formKey.currentState!.validate();
                        });
                      },
                    ),
                    SizedBox(height: 40, width: 20),
                    ElevatedButton(
                        onPressed: () => signIn(requestParam: {
                              "userName": _userNameController.text,
                              "password": _passwordController.text,
                            }, queryParam: {}),
                        style: ElevatedButton.styleFrom(
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

  Future<void> signIn({
    Map<String, dynamic> requestParam = const {},
    Map<String, dynamic> queryParam = const {},
  }) async {
    if (_formKey.currentState!.validate()) {
      try {
        var response = await AuthenticationViewModel().signIn(
          "/Auth/Login",
          requestParam,
          {},
          queryParam,
        );

        if (response != null && response["success"] == true) {
          // Successful Login
          if (mounted) {    
            String userId = response["user"][0]["userId"];
            print("userId: $userId"); 
            const storage = FlutterSecureStorage();
            await storage.write(key: 'loggedInUserId', value: userId);        
            Navigator.pushNamed(context, MyRoutes.homeRoute, arguments: true);
          }
        } else {
          // Invalid Credentials
          DelightToastBar(
            builder: (context) {
              return ToastCard(
                title: Text(
                  "Invalid credentials, please try again.",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              );
            },
            position: DelightSnackbarPosition.top,
            snackbarDuration: Durations.extralong2,
            autoDismiss: true,
          ).show(context);
        }
      } catch (err) {
        DelightToastBar(
          builder: (context) {
            return ToastCard(
              title: Text(
                "An error occurred. Please try again later.",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            );
          },
          position: DelightSnackbarPosition.top,
          snackbarDuration: Durations.extralong2,
          autoDismiss: true,
        ).show(context);
      }
    }
    else{
      
    }
  }
}
