import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:my_app/view/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  @override
  void initState() {
    
    super.initState();
    // Get the login success argument from Navigator
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args == true) {
        DelightToastBar(
          builder: (context) {
            return ToastCard(
              title: Text(
                "Login Successful",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            );
          },
          position: DelightSnackbarPosition.top,
          snackbarDuration: Durations.extralong2,
          autoDismiss: true,
        ).show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("EleRide", style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
        //leading: Icon(CupertinoIcons.),
      ),
      body: Center(
          child: Text("Hello Flutter")
        
      ),
      drawer: AppDrawer(),
      
    );
  }
}