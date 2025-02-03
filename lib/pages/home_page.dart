import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
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
        child: Container(
          child: Text("Hello Flutter")
        )
      ),
      drawer: AppDrawer(),
      
    );
  }
}