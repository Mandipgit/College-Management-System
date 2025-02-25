import 'package:flutter/material.dart';
import 'package:teachers/Pages/notificationPage.dart';
import 'package:teachers/main.dart';

void main() {
  runApp(MyApp());
}

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  Color blueColor = Color(0xFF167AFA);
  Color greyColor = Color.fromARGB(255, 228, 224, 224);
  bool iconChecked=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Teacher",
          style: TextStyle(
            color: Colors.white,
          ),),
          backgroundColor: blueColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Notificationpage()));
                  });
                },
                icon: Icon(Icons.notifications))
          ],
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: blueColor,
                  )),
              // const SizedBox(height:10),
              Container(
                height: MediaQuery.of(context).size.height * 0.64,
                
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: greyColor,
                ),
                child: ListTile(),
              )
            ],
          ),
        ),
        body: Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right:20),
              child: Container(
                height: 150,
                width: double.maxFinite,
              decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello Mandip",
                          style:TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )
                          ),
                          const SizedBox(height: 5),
                         Row(
                           children: [
                             !iconChecked?Container(
                              height: 40,
                              width: 213,
                              decoration: BoxDecoration(
                                color: blueColor,
                              ),
                              child: Row(
                             
                                children: [
                                  Text("Mark Your Attendance",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  ),
                                  const SizedBox(width:1),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      iconChecked=!iconChecked;
                                    });
                                  }, 
                                  icon:Icon(Icons.add_box_outlined),
                                  color: Colors.white,
                                  ),
                                 ],
                              ),
                             ):Container(
                               height: 40,
                              width: 213,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: greyColor,
                              ),
                             
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text("Attendance Done",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: blueColor,
                                  ),
                                  ),
                                ),
                              ),
                             ],
                         )
                        ],
                      ),
                      const SizedBox(width: 30),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CircleAvatar(
                              radius:45 ,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          ],
                    ),
                ),
                ),
              ),
              
              )
        
      );
  }
}
