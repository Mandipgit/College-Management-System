import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/assignment.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/test.dart';

final List<String>faculties=['BSc.CSIT','BIT','B.Tech','BND','Physics','Geology'];
final List <String>Semester=['1stSemester','2ndSemester','3rdSemester','4thSemester','5thSemester','6thSemester','7thSemester','8thSemester'];
final List <String>Year=['1st Year','2nd Year','3rd Year','4th Year'];
showBottomSheetFaculty(BuildContext context){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height*0.43,
      decoration: BoxDecoration(
        color: secBlueColor,
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
      height: MediaQuery.of(context).size.height*0.43,
      decoration: BoxDecoration(
        color: secBlueColor,
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignmentPage(faculty: faculty, Semester: Semester[index])));
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
        color: secBlueColor,
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignmentPage(faculty: faculty, Semester: Year[index])));
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
                  take_assignment=true;
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
                  showBottomSheetFaculty(context);
                },
              ),
            ],
          ),
        );
      });
}




 