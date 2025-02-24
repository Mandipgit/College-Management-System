import 'package:flutter/material.dart';

import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/main.dart';

void main(){
  runApp(MyApp());
}
class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => NotificationpageState();
}

class NotificationpageState extends State<Notificationpage> {
   Color blueColor=  Color(0xFF167AFA);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          title: Text('Notification Page',
          style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            setState(() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboardpage()));
            });
          },
          color: Colors.white,
          icon: Icon(Icons.arrow_back)),
        ),
      ),
    );
  }
}