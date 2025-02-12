import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_app/utils/utils.dart';
import 'package:my_app/view_models/userVM.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserViewModel _userViewModel = UserViewModel();

  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    const storage = FlutterSecureStorage();
    String? userId = await storage.read(key: 'loggedInUserId');
    if (userId != null) {
      await _getUserData(userId);
    }
  }

  Future<void> _getUserData(String userId) async {
    var response = _userViewModel
        .getUserInfo('/User/GetUserInfo', {}, {}, {'userId': userId});
    response.then((value) {
      if (value != null) {
        setState(() {
          SetUserData(value);
        });
      }
    });
  }

  SetUserData(data) {
    _userNameController.text = data['userName'];
    _firstNameController.text = data['firstName'];
    _lastNameController.text = data['lastName'];
    _emailController.text = data['email'];
    _phoneController.text = data['phoneNumber'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(children: [
        Text("Update Profile"),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: "UserName",
                    enabled: true,
                  )),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    hintText: "Enter First Name",
                  )),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    hintText: "Enter Last Name",
                  )),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter Email",
                  )),
            )
          ],
        ),
        TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter Phone Number",
            )),
        SizedBox(height: 16, width: 20),
        ElevatedButton(
            onPressed: () {
              handleProfileUpdate();
            },
            child: Text(
              "Update",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
      ]),
    ));
  }

  handleProfileUpdate() {
    if (_formKey.currentState!.validate()) {
      var response =
          _userViewModel.updateUserInfo('/User/UpdateUserDetails', {
        'userName': _userNameController.text,
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneController.text,
      }, {}, {});
      response.then((value) {
        if (value != null) {
          setState(() {
            SetUserData(value);
          });
        }
      });
      DelightToastBar(
        builder: (context) {
          return ToastCard(title: Text('Data Updated Successfully',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ));
        },
        position: DelightSnackbarPosition.top,
        snackbarDuration: Durations.extralong2,
        autoDismiss: true,
      ).show(context);
    }
  }
}
