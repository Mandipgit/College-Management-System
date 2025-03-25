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
    addHeading();
    addNotice();
    viewnotice();
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
            itemCount: headingList.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: ListTile(
                    title: Text(headingList[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                    ),
                    ),
                   
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>viewNotice(viewheading: headingList[index], viewnotice: noticeList[index])));
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
