import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/publishNotice.dart';

class viewHistory extends StatefulWidget {
   final String heading;
   final String notice;
  viewHistory({required this.heading,required this.notice});

  @override
  State<viewHistory> createState() => _viewHistoryState();
}

class _viewHistoryState extends State<viewHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            "Notice History",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => publishNotice()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Container(
          height: 100,
          width: double.maxFinite,
          child: Text("${widget.heading}"),
        ),
      ));
  }
}