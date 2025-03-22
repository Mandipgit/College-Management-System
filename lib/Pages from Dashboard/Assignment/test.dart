import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class test_Page extends StatefulWidget {
  final String testfaculty;
  final String testSemester;
  final String testYear;
  const test_Page({required this.testfaculty,required this.testSemester,required this.testYear});

  @override
  State<test_Page> createState() => _test_PageState();
}

class _test_PageState extends State<test_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
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
         body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 45,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Center(
                child: Text((widget.testfaculty=="BSc.CSIT"||widget.testfaculty=="BIT")?
                "${widget.testfaculty}(${widget.testSemester})":
                  "${widget.testfaculty}(${widget.testYear})",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
              ),
            ),
          )
        ],
      ),
      ));
  }
}