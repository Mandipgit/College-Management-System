import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class test_Page extends StatefulWidget {
  const test_Page({super.key});

  @override
  State<test_Page> createState() => _test_PageState();
}

class _test_PageState extends State<test_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          title: Text("Test",
          style: TextStyle(
            color: Colors.white,
          )
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboardpage()));
          }, icon: Icon(Icons.arrow_back),
          color: Colors.white,
          ),
        ),
      ));
  }
}