import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class assignment_Page extends StatefulWidget {
  const assignment_Page({super.key});

  @override
  State<assignment_Page> createState() => _assignment_PageState();
}

class _assignment_PageState extends State<assignment_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Assignment Page",
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          backgroundColor: blueColor,
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboardpage()));
          }, icon: Icon(Icons.arrow_back),
          color:Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height:80,
                  width:100,
                  decoration: BoxDecoration(
                    color: blueColor,
                  ),
                  child: switch (assignment){
                    1=>Text('BscCsit'),
                    2=>Text('BIT'),
                    3=>Text('B.Tech'),
                    4=>Text('BND'),
                    5=>Text('Physics'),
                    6=>Text('Geology'),
                    int()=>Text('Unknown Course')
                  },
                 ),
              )
            ],
          ),
        ),
      ));
  }
}