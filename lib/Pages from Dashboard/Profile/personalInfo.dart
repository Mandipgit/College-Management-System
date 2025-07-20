import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Profile/Profilepage.dart';

class Personalinfo extends StatefulWidget {
  const Personalinfo({super.key});

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Personal Information",
          style: TextStyle(
            color: Colors.white,
              fontWeight: FontWeight.w900,
          ),),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => profilePage()),
              );
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}