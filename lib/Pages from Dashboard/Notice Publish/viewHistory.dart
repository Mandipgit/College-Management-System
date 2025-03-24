import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/publishNotice.dart';

final List<String>headingList=[];
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
  void initState(){
    super.initState();
    addHeading();
  }
  void addHeading(){
    setState(() {
      headingList.add(widget.heading);
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
                height: 200,
                child: Card(
                  child: ListTile(
                    title: Text(headingList[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    ),
                    
                  ),
                ),
              ),
            );
        })
      ));
  }
}
