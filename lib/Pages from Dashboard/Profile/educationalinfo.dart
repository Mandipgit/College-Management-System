import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Profile/Profilepage.dart';

class educationalinfo extends StatefulWidget {
  const educationalinfo({super.key});

  @override
  State<educationalinfo> createState() => _educationalinfoState();
}

class _educationalinfoState extends State<educationalinfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Professional Information",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>profilePage()));
          }, icon: Icon(Icons.arrow_back),
          color: Colors.white,
          ),
        ),
      ),
    );
  }
}