import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class Btech1st extends StatefulWidget {
  const Btech1st({super.key});

  @override
  State<Btech1st> createState() => _Btech1stState();
}

class _Btech1stState extends State<Btech1st> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment"),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboardpage()));
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: 100,
        width: 100,
        child: Text(""),
      ),
    );
  }
}