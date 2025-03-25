import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/publishNotice.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/viewNotice.dart';

final List<String>headingList=[];
final List<String>noticeList=[];
String updateheading="";
String updatenotice="";
  
class viewHistory extends StatefulWidget {
   final String heading;
   final String notice;
   final List<String> faculty;
   viewHistory({required this.heading,required this.notice,required this.faculty});

  @override
  State<viewHistory> createState() => _viewHistoryState();
}

class _viewHistoryState extends State<viewHistory> {
  @override
   void viewnotice(){
     for(int i=0; i<headingList.length && i<noticeList.length;i++){
      if(headingList[i]==noticeList[i]){
        String updateheading=headingList[i];
        String updatenotice=noticeList[i];
      }
     }
  }
  void initState(){
    super.initState();
    addHeading();
  }
  void addHeading(){
    setState(() {
      headingList.add(widget.heading);
    });
    }
    void addNotice(){
    setState(() {
      noticeList.add(widget.notice);
    });
    }
  @override
  Widget build(BuildContext context) {
    print(headingList);
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
        ListView.builder(
          itemCount: headingList.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 70,
                child: Card(
                  color: Colors.blueGrey[400],
                  child: ListTile(
                    title: Text(headingList[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900
                    ),
                    ),
                   
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>viewNotice(viewheading: updateheading, viewnotice: updatenotice)));
                      });
                    },
                  ),
                ),
              ),
            );
        })
      ));
  }
}
