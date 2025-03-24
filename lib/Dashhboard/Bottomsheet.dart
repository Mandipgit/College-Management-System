import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/assignment.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/test.dart';
import 'package:teachers/Pages%20from%20Dashboard/Chat/Parents.dart';
import 'package:teachers/Pages%20from%20Dashboard/Student/attendance.dart';
import 'package:teachers/Pages%20from%20Dashboard/Student/studentdetails.dart';
import 'package:teachers/Theme/theme_provider.dart';

final List<String>faculties=['BSc.CSIT','BIT','B.Tech','BND','Physics','Geology'];
final List <String>Semester=['1stSemester','2ndSemester','3rdSemester','4thSemester','5thSemester','6thSemester','7thSemester','8thSemester'];
final List <String>Year=['1st Year','2nd Year','3rd Year','4th Year'];
bool takeTest=false;
bool stddetails=false;
bool stdattenndance=false;
bool assignment=false;
bool parentschat=false;
showBottomSheetFaculty(BuildContext context){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height*0.43,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only( topLeft: Radius.circular(20),  topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
         itemCount:faculties.length,
         itemBuilder: (context, index){
           return ListTile(
             title: Text(faculties[index],
              style: TextStyle(
                 color: Colors.white,
                 fontSize: 20,
                 fontWeight: FontWeight.w600,)),
                 onTap: (){
                 if(faculties[index]=='BSc.CSIT'||faculties[index]=='BIT'){
                  showBottomSheetSemester(context,faculties[index]);
                 }
                 else {
                  showBottomSheetYear(context,faculties[index]);
                 }
                    },
           );
         }),
      )  
    );
    
  });
}
showBottomSheetSemester(BuildContext context,String faculty){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height*0.52,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only( topLeft: Radius.circular(20),  topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
         itemCount:Semester.length,
         itemBuilder: (context, index){
           return ListTile(
             title: Text(Semester[index],
              style: TextStyle(
                 color: Colors.white,
                 fontSize: 20,
                 fontWeight: FontWeight.w600,)),
                 onTap: (){
               String year = (index < Year.length) 
                    ? Year[index] 
                    : "4th Year"; 
                    takeTest
                    ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => test_Page(
                          testfaculty: faculty,
                          testSemester: Semester[index],
                          testYear: year,
                        ))):stddetails?Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => studentDetails(
                          faculty: faculty,
                          Semester: Semester[index],
                          Year: year,
                        ))):
                        stdattenndance? Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => attendance(
                          faculty: faculty,
                          Semester: Semester[index],
                          Year: year,
                        ))):parentschat? Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => parentsChat(
                          faculty: faculty,
                          Semester: Semester[index],
                          Year: year,
                        )))
                    : Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => assignmentPage(
                          faculty: faculty,
                          Semester: Semester[index],
                          Year: year,
                        )));
                 },
           );
         }),
      )  
    );
    });
}
showBottomSheetYear(BuildContext context,String faculty){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only( topLeft: Radius.circular(20),  topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
         itemCount:Year.length,
         itemBuilder: (context, index){
           return ListTile(
             title: Text(Year[index],
              style: TextStyle(
                 color: Colors.white,
                 fontSize: 20,
                 fontWeight: FontWeight.w600,)),
                 onTap: (){
                  takeTest?(Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>test_Page(testfaculty: faculty, testSemester: Semester[index],testYear: Year[index],)))):
                  stddetails?(Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>studentDetails(faculty:faculty,Semester:Semester[index],Year:Year[index])))):
                  stdattenndance?(Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>attendance(faculty:faculty,Semester:Semester[index],Year:Year[index])))):
                  parentschat?(Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parentsChat(faculty:faculty,Semester:Semester[index],Year:Year[index])))):
                  (Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignmentPage(faculty:faculty,Semester:Semester[index],Year:Year[index]))));
                 },
                 );
         }),
      )  
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
            borderRadius: BorderRadius.only( topLeft: Radius.circular(20),  topRight: Radius.circular(20)),
            color: Theme.of(context).colorScheme.secondary,
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
                    color:Color.fromARGB(255, 228, 224, 224),
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
                        color: Colors.black
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
                    color:Color.fromARGB(255, 228, 224, 224),
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
                        color: Colors.black
                      ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  takeTest=true;
                  showBottomSheetFaculty(context);
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
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only( topLeft: Radius.circular(20),  topRight: Radius.circular(20)),
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
                    color:Color.fromARGB(255, 228, 224, 224),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.asset('Assets/attendance.png',
                        height:75,
                        ),
                      ),
                      Text('Attendance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),)
                    ],
                  ),
                ),
                onTap: (){
                  stdattenndance=true;
                  showBottomSheetFaculty(context);
                },
              ),
              const SizedBox(width: 40),
              GestureDetector(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color:Color.fromARGB(255, 228, 224, 224),
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
                        color: Colors.black
                      ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  stddetails=true;
                  showBottomSheetFaculty(context);
                },
              ),
            ],
          ),
    );
  });
}
void showBottomSheetPublishNotice(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height*0.55,
          decoration: BoxDecoration(
           borderRadius: BorderRadius.only( topLeft: Radius.circular(30),  topRight: Radius.circular(30)),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top:20),
                child: Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
                    color: mode?(Colors.grey[800]):(Colors.grey[400])
                  ),
                  child: Column(
                    children: [
                      TextField(
                        maxLines: 2,
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 17
                        ),
                        decoration: InputDecoration(
                          hintText: "Write Heading For Notice..",
                          enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            borderSide: BorderSide(color: mode?(primarygrey):(blueColor))
                          ),
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            borderSide: BorderSide(color: mode?(primarygrey):(blueColor)),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                          ),
                          fillColor: mode?(Colors.grey[850]):(blueColor),
                          filled: true,
                          ),
                      ),
                       TextField(
                        maxLines: 8,
                  decoration: InputDecoration(
                  hintText: "Type Here",
                  border: InputBorder.none,
                  ),
              )
                    ],
                  ),
                  
                ),
              ),
             
            ],
          ),
         );
      });
}


 