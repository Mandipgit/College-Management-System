import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class teacherChat extends StatelessWidget {
  const teacherChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Teacher Section",
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