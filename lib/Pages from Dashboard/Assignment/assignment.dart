import 'package:flutter/material.dart';
import 'package:teachers/Bottomsheet.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class assignmentPage extends StatefulWidget {
  final String faculty;
  final String Semester;
  final String Year;
  const assignmentPage(
      {required this.faculty, required this.Semester, required this.Year});

  @override
  State<assignmentPage> createState() => _assignmentPageState();
}

class _assignmentPageState extends State<assignmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          "Assignment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Dashboardpage()));
              });
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_back)),
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
                color: secBlueColor,
              ),
              child: Center(
                child: Text(
                  (widget.faculty == "BSc.CSIT" || widget.faculty == "BIT")
                      ? "${widget.faculty} (${widget.Semester})"
                      : "${widget.faculty} (${widget.Year})",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
