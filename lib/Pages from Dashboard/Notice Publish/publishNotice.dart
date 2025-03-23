import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Theme/theme_provider.dart';
String selectfaculty="BSc.CSIT";
String selectSemester="1stSemester";
String selectYear="1st Year";
final List<String> faculties = [
  'BSc.CSIT',
  'BIT',
  'B.Tech',
  'BND',
  'Physics',
  'Geology'
];
final List <String>Semester=['1stSemester','2ndSemester','3rdSemester','4thSemester','5thSemester','6thSemester','7thSemester','8thSemester'];
final List <String>Year=['1st Year','2nd Year','3rd Year','4th Year'];
final List <String>Selecteditems=[];

class publishNotice extends StatefulWidget {
  
  const publishNotice({super.key});

  @override
  State<publishNotice> createState() => _publishNoticeState();
  
}

class _publishNoticeState extends State<publishNotice> {
  dropDownSemester(BuildContext context,selectSemester){
return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Text(
                "Semester",
                style: TextStyle(
                  color: mode ? (Colors.white) : (Colors.black),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: mode ? (Colors.grey[900]) : (greyColor),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 2,
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: mode?(Colors.grey[900]):(greyColor),
                          value: selectSemester,
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 250),
                            child: Icon(Icons.arrow_drop_down,
                            color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          onChanged: (String? newValue1) {
                          setState(() {
                            selectSemester=newValue1!;
                          });
                              },
                          items: Semester.map((String Semester) {
                            return DropdownMenuItem<String>(
                              value: Semester,
                              child: Text(Semester,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.outline
                              ),
                              ),
                            );
                          }).toList(),
                        ),
                  ),
                )
              ),
            )
          ],
        );
}
dropDownYear(BuildContext context,selectYear){
return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Text(
                "Year",
                style: TextStyle(
                  color: mode ? (Colors.white) : (Colors.black),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: mode ? (Colors.grey[900]) : (greyColor),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 2,
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: mode?(Colors.grey[900]):(greyColor),
                          value: selectYear,
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 250),
                            child: Icon(Icons.arrow_drop_down,
                            color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          onChanged: (String? newValue2) {
                          setState(() {
                            selectYear=newValue2!;
                          });
                              },
                          items: Year.map((String Year) {
                            return DropdownMenuItem<String>(
                              value: Year,
                              child: Text(Year,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.outline
                              ),
                              ),
                            );
                          }).toList(),
                        ),
                  ),
                )
              ),
            )
          ],
        );
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            "Notice Section",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Dashboardpage()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Text(
                "Faculty",
                style: TextStyle(
                  color: mode ? (Colors.white) : (Colors.black),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: mode ? (Colors.grey[900]) : (greyColor),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 2,
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: mode?(Colors.grey[900]):(greyColor),
                          value: selectfaculty,
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 280),
                            child: Icon(Icons.arrow_drop_down,
                            color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          onChanged: (String? newValue) {
                           setState(() {
                              selectfaculty=newValue!;
                             
                              }
                           );
                          },
                          items: faculties.map((String faculty) {
                            return DropdownMenuItem<String>(
                              value: faculty,
                              child: Text(faculty,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.outline
                              ),
                              ),
                            );
                          }).toList(),
                        ),
                  ),
                )
              ),
            ),
            const SizedBox(height: 10,),
             selectfaculty=="BSc.CSIT"?(dropDownSemester(context,selectSemester)):selectfaculty=="BIT"?(dropDownSemester(context,selectSemester)):(dropDownYear(context,selectYear)),
            const SizedBox(height: 5,),
            TextButton(onPressed: (){
              setState(() {
                Selecteditems.add(selectfaculty);
              });
            }, child: Text("Select")),
            
          ],
        ),
      ),
    );
    ;
  }
}
