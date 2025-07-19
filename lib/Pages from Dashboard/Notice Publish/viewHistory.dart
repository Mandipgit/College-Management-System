import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/publishNotice.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/viewNotice.dart';
import 'package:teachers/Theme/theme_provider.dart';
import'dart:io';
import 'package:intl/intl.dart';

final List<String>headingList=[];
final List<String>noticeList=[];
 String updateheading="";
String updatenotice="";
final List<String> publishTimes = [];
bool displayDown=false;

  
class viewHistory extends StatefulWidget {
   final String heading;
   final String notice;
   final List<String> faculty;
    final String fileName;       
  final String filePath;       
  final String fileExtension;  
   viewHistory({required this.heading,required this.notice,required this.faculty,required this.fileName,required this.fileExtension,required this.filePath});

  @override
  State<viewHistory> createState() => _viewHistoryState();
}

class _viewHistoryState extends State<viewHistory> {
  
   viewnotice(){
    setState(() {
       if(headingList.isNotEmpty&&noticeList.isNotEmpty){
        updateheading=headingList.last;
         updatenotice=noticeList.last;
      }
     
    });
  }
  void initState(){
    super.initState();
    addNoticeAndHeading();
    viewnotice();
  }
  void addNoticeAndHeading() {
  setState(() {
    
    if (!headingList.contains(widget.heading) || !noticeList.contains(widget.notice)) {
      headingList.add(widget.heading);
      noticeList.add(widget.notice);
      publishTimes.add(DateTime.now().toIso8601String());
    }
  });
}

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
        body:  
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: headingList.length < publishTimes.length?headingList.length:publishTimes.length,
            itemBuilder: (context,index){
              DateTime publishedAt = DateTime.parse(publishTimes[index]);
              String displayDateTime = DateFormat('MMM d, yyyy HH:mm').format(publishedAt);
              return Padding(
                padding: const EdgeInsets.only(top: 5,left: 3,right:3),
                child: Card(
                  elevation: 4,
                  color: mode?(Colors.grey[900]):(Colors.white),
                  child: ListTile(
                    title: Text(headingList[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: mode?(Colors.white):(Colors.black),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Uploaded:$displayDateTime",
                        style:TextStyle(
                          color:mode?(Colors.grey[300]):(Colors.grey[800]),
                          fontSize: 13,
                        )),
                        const SizedBox(height: 6),
                        Container(
                          height:40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.red[600],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: TextButton(onPressed: (){}, child:Text("Delete",),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                    
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>viewNotice(viewheading: headingList[index], viewnotice: noticeList[index],   fileName: widget.fileName,
  filePath: widget.filePath,
  fileExtension: widget.fileExtension,)));
                      });
                    },
                  ),
                ),
              );
          }),
        )
      ));
  }
}
