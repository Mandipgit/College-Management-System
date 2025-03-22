import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class attendance extends StatefulWidget {
  final String faculty;
  final String Semester;
  final String Year;
  const attendance(
      {required this.faculty, required this.Semester, required this.Year});

  @override
  State<attendance> createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Attendance",
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
                color: Theme.of(context).colorScheme.secondary,
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
