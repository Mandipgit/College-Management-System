import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/publishNotice.dart';


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
    print(widget.viewheading);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            "View Notice",
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
        body: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
            children: [
              Text("${widget.viewheading}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),
              ),
              const SizedBox(height: 10,),
              Text("${widget.viewnotice}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w800
              ),
              ),
            ],
          ),
        ),
    );
  }
}