import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => NotificationpageState();
}

class NotificationpageState extends State<Notificationpage> {
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
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