import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/publishNotice.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/viewHistory.dart';

class viewNotice extends StatefulWidget {
  final String viewheading;
   final String viewnotice;
  const viewNotice({super.key,required this.viewheading,required this.viewnotice});

  @override
  State<viewNotice> createState() => _viewNoticeState();
}

class _viewNoticeState extends State<viewNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.viewheading,
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
    );
  }
}