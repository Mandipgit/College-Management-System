import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/B.tech/B.tech1st.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/assignment.dart';
import 'package:teachers/Pages%20from%20Dashboard/Assignment/test.dart';

List<String>faculties=['Bsc.CSIT','BIT','B.Tech','BND','Physics','Geology'];
List <String>Semester=['1stSemester','2ndSemester','3rdSemester','4thSemester','5thSemester','6thSemester','7thSemester','8thSemester'];
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
           );
         }),
      )  
    );
    
  });
}
void showBottomSheetSemester(BuildContext context){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height*0.52,
      decoration: BoxDecoration(
        color:secBlueColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              itemCount: Semester.length,
              itemBuilder: (context,index){
                ListTile(
                
                 );
              })
          ],
        ),
      ),
    );
  });
}
// void showBottomSheetYear(BuildContext context){
//   showModalBottomSheet(context: context, builder: (context){
//     return Container(
//        height: MediaQuery.of(context).size.height*0.27,
//       decoration: BoxDecoration(
//         color:secBlueColor,
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ListTile(
//               title: Text('1st Year',
//                style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,)),
//                                 onTap: (){
                    
// take_assignment?(
//                 assignment=1,
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()))
//               ):(
//                 test=1,
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>test_Page()))
//               );
//                   },
//             ),
            
//             ListTile(
//               title: Text('2nd Year',
//                style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,)),
//                                 onTap: (){
                    
// take_assignment?(
//                 assignment=2,
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()))
//               ):(
//                 test=2,
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>test_Page()))
//               );
//                   },
//             ),
            
//             ListTile(
//               title: Text('3rd Year',
//                style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,)),
//                                 onTap: (){
                    
// take_assignment?(
//                 assignment=3,
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()))
//               ):(
//                 test=3,
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>test_Page()))
//               );
//                   },
//             ),
            
//             ListTile(
//               title: Text('4th Year',
//                style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,)),
//                                 onTap: (){
                    
// take_assignment?(
//                 assignment=4,
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignment_Page()))
//               ):(
//                 test=4,
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>test_Page()))
//               );
//                   },
//             ),
//         ]),
//       ),
//     );
  
//   });
// }
// void showBottomSheetStudent(BuildContext context){
//   showModalBottomSheet(context: context, builder: (context){
//     return Container(
//       height: MediaQuery.of(context).size.height*0.25,
//       decoration: BoxDecoration(
//         color: secBlueColor,
//         borderRadius: BorderRadius.only( topLeft: Radius.circular(20),  topRight: Radius.circular(20)),
//       ),
//        child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 child: Container(
//                   height: 130,
//                   width: 130,
//                   decoration: BoxDecoration(
//                     color:greyColor,
//                     borderRadius: BorderRadius.only( topLeft: Radius.circular(20),  topRight: Radius.circular(20)),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: .0),
//                         child: Image.asset('Assets/attendance.png',
//                         height:80,
//                         ),
//                       ),
//                       Text('Attendance',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),)
//                     ],
//                   ),
//                 ),
//                 onTap: (){
                  
//                 },
//               ),
//               const SizedBox(width: 40),
//               GestureDetector(
//                 child: Container(
//                   height: 130,
//                   width: 130,
//                   decoration: BoxDecoration(
//                     color:greyColor,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Image.asset('Assets/student_details.png',
//                         height: 80,
//                         ),
//                       ),
//                       Text('Student Details',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 onTap: () {
//                   showBottomSheetFaculty(context);
//                 },
//               ),
//             ],
//           ),
//     );
//   });
// }
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
// void showFacultySemester(BuildContext context, Faculty,int Semester){
// List <int> navigation=[Faculty,Semester];
// switch (navigation){
//   case(1,1): Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Btech1st()))
// }
// }


 