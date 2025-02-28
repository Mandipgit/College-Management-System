import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/assignment.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/test.dart';
showBottomSheetFaculty(BuildContext context){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height*0.45,
      decoration: BoxDecoration(
        color: secBlueColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("BSc.CSIT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            ),
            onTap: (){
           assignment=1;
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()));
          },
          ),
          ListTile(
            title: Text("BIT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),),
            onTap: (){
              assignment=2;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()));
            },
          ),
          ListTile(
            title: Text("B.Tech",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),),
             onTap: (){
              assignment=3;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()));
            },
          ),
          ListTile(
            title: Text("BND",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),),
             onTap: (){
              assignment=4;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()));
            },
          ),
          ListTile(
            title: Text("Physics",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),),
             onTap: (){
              assignment=5;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()));
            },
          ),
          ListTile(
            title: Text("Geology",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),),
             onTap: (){
              assignment=6;
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()));
            },
          ),
        ],
      ),
    );
  });
}
void showBottomSheetStudent(BuildContext context){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height*0.25,
      decoration: BoxDecoration(
        color: secBlueColor,
        borderRadius: BorderRadius.circular(20),
      ),
       child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color:greyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: .0),
                        child: Image.asset('Assets/attendance.png',
                        height:80,
                        ),
                      ),
                      Text('Attendance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),)
                    ],
                  ),
                ),
                onTap: (){
                  
                },
              ),
              const SizedBox(width: 40),
              GestureDetector(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color:greyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset('Assets/student_details.png',
                        height: 80,
                        ),
                      ),
                      Text('Student Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  showBottomSheetFaculty(context);
                },
              ),
            ],
          ),
    );
  });
}
void showBottomSheetAssignment(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height*0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: secBlueColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color:greyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: .0),
                        child: Image.asset('Assets/give_assignment.png',
                        height:80,
                        ),
                      ),
                      Text('Assignment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),)
                    ],
                  ),
                ),
                onTap: (){
                 showBottomSheetFaculty(context);
                },
              ),
              const SizedBox(width: 40),
              GestureDetector(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color:greyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset('Assets/test.png',
                        height: 80,
                        ),
                      ),
                      Text('Take Test',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>test_Page()));
                },
              ),
            ],
          ),
        );
      });
}

 