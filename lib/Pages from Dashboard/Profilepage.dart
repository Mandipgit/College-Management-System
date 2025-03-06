import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  bool setting=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("View Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
          ),
          centerTitle: true,
          backgroundColor: secBlueColor,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboardpage()));
          }, icon: Icon(Icons.arrow_back),
          color: Colors.white,
          ),
          actions: [
            IconButton(onPressed: (){
              showDialog(context: context, builder:(context){
                return Dialog(
                  child: SizedBox(
                    height: 45,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Logout"),
                        )
                      ],
                    ),
                  ),
                );
              });
            }, 
            icon: Icon(Icons.settings))
          ],
          ),
         
        body: Expanded(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.30,
                width:double.maxFinite,
                decoration: BoxDecoration(
                  color: secBlueColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                       CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.white,
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipOval(
                              child: Image.asset(
                                'Assets/sleepyDiet.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 80,
                          width: double.maxFinite,
                          color: secBlueColor,
                          child: Center(
                            child: Column(
                              children: [
                                Text("Mandip Pokharel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),),
                                 const SizedBox(height: 5),
                                Text("Studied BSc.CSIT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                 ),),
                                
                                Text("Tribhuvan University",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  
                                )
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      );
  }
}
