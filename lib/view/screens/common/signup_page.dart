import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/utils/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/register.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 110),
              child: Text(
                "Create\nAccount",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.person_solid,
                              color: Colors.white),
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Enter username",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: _userNameController,
                      ),
                      SizedBox(height: 20, width: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.mail_solid,
                              color: Colors.white),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Enter email",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: _emailController,
                      ),
                      SizedBox(height: 20, width: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.lock_fill,color: Colors.white),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Enter password",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: _passwordController,
                      ),
                      SizedBox(height: 30, width: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.lock_fill,
                              color: Colors.white),
                          labelText: "Last Name",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Enter Last Name",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: _lastNameController,
                      ),
                      SizedBox(height: 30, width: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.lock_fill,
                              color: Colors.white),
                          labelText: "First Name",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Enter First Name",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: _firstNameController,
                      ),
                      SizedBox(height: 30, width: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.lock_fill,
                              color: Colors.white),
                          labelText: "Phone Number",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Enter Phone Number",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: _phoneController,
                      ),
                      SizedBox(height: 30, width: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sign Up",style: TextStyle(color: Color(0xff4c505b),fontSize: 27,fontWeight: FontWeight.w500),),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xff4c505b),
                            child: IconButton(
                                color: Colors.white,
                                onPressed: () => HandleSignUp(
                                  requestParam: {
                                    "userName": _userNameController.text,
                                    "password": _passwordController.text,
                                    "email": _emailController.text,
                                    "lastName": _lastNameController.text,
                                    "firstName": _firstNameController.text,
                                    "phoneNumber": _phoneController.text,
                                  },
                                  queryParam: {},
                                ),
                                icon: Icon(Icons.arrow_forward_sharp,color: Colors.white)),
                          ), 
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> HandleSignUp({
    Map<String, dynamic> requestParam = const {},
    Map<String, dynamic> queryParam = const {},
  }) async {
    if (_formKey.currentState!.validate()) {
      try {
        var response = await AuthenticationViewModel().signUp(
          "/User/SignUp",
          requestParam,
          {},
          queryParam,
        );

        if (response != null && response["success"] == true) {
          // Successful Login
          if (mounted) {
            Navigator.pushNamed(context, MyRoutes.loginRoute, arguments: true);
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
  }
  HandleSignIn(){

  }
}
