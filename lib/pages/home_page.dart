import 'package:flutter/material.dart';

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
        title: Text("EleRide", style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
      ),
      body: Center(
        child: Container(
          child: Text("Hello Flutter")
        )
      ),
      drawer: Drawer(),
      
    );
  }
}