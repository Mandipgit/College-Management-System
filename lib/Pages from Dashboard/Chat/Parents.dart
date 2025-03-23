import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class parentsChat extends StatelessWidget {
  final String faculty;
  final String Semester;
  final String Year;
  const parentsChat(
      {required this.faculty, required this.Semester, required this.Year});
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Parents Section",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboardpage()));
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        ),
      ),
    );
  }
}