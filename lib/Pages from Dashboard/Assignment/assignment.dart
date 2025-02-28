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
        body: 
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Container(
                      height:50,
                      width:double.maxFinite,
                      decoration: BoxDecoration(
                        color: secBlueColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: switch (assignment){
                          1=>Text('BscCsit',
                           style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                           ),
                          ),
                          2=>Text('BIT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),),
                          3=>Text('B.Tech',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),),
                          4=>Text('BND',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),),
                          5=>Text('Physics',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),),
                          6=>Text('Geology',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),),
                          int()=>Text('Unknown Course',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                          )
                        },
                      ),
                     ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}