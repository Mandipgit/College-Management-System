import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/viewHistory.dart';
import 'package:teachers/Theme/theme_provider.dart';
String selectfaculty="BSc.CSIT";
String selectSemester="1st Sem";
String selectYear="1st Year";
bool Select=false;
final List<String> faculties = [
  'BSc.CSIT',
  'BIT',
  'B.Tech',
  'BND',
  'Physics',
  'Geology'
];
final List <String>Semester=['1st Sem','2nd Sem','3rd Sem','4th Sem','5th Sem','6th Sem','7th Sem','8th Sem'];
final List <String>Year=['1st Year','2nd Year','3rd Year','4th Year'];
final List <String>Selecteditems=[];
final List <String>listHeading=[];
final List <String>listNotice=[];
final List <String>Noticepublish=[];
var headingController=TextEditingController();
var noticeController=TextEditingController();


class publishNotice extends StatefulWidget {
  
  const publishNotice({super.key});

  @override
  State<publishNotice> createState() => _publishNoticeState();
  
}

class _publishNoticeState extends State<publishNotice> {
  void addSelecteditems(){
    setState(() {
      String selectedText=(selectfaculty=="BSc.CSIT")?("$selectfaculty($selectSemester)"):(selectfaculty=="BIT")?("$selectfaculty($selectSemester)"):("$selectfaculty($selectYear)");
     if(!Selecteditems.contains(selectedText)){
       Selecteditems.add(selectedText);
     }
    });
  }
  dropDownSemester(BuildContext context){
return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Text(
                "Semester",
                style: TextStyle(
                  color: mode ? (Colors.white) : (Colors.black),
                  fontWeight: FontWeight.w900,
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
                          onChanged: (String? newValue) {
                          setState(() {
                            selectSemester=newValue!;
                          });
                              },
                          items: Semester.map((String semester) {
                            return DropdownMenuItem<String>(
                              value: semester,
                              child: Text(semester,
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
dropDownYear(BuildContext context){
return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Text(
                "Year",
                style: TextStyle(
                  color: mode ? (Colors.white) : (Colors.black),
                  fontWeight: FontWeight.w900,
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
                          onChanged: (String? newValue) {
                          setState(() {
                            selectYear=newValue!;
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
Widget buildPostButton(){
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: FloatingActionButton(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100)
      ) ,
      onPressed: (){
      setState(() {
        Select?(showBottomSheetPublishNotice(context)):();
      });},
      child: Icon(Icons.add,color: Colors.white,),
      ),
  );
}
void showBottomSheetPublishNotice(BuildContext context) {
  var headingController=TextEditingController();
  var noticeController=TextEditingController();
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
                        controller: headingController,
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
                        controller: noticeController,
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
             TextButton(onPressed: (){
              setState(() {
                addNotice();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>viewHistory(heading: headingController.text, notice: noticeController.text,faculty: Selecteditems,)));
              });
             }, 
             child: Text("Publish",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                    ),
                    )),
            ],
          ),
         );
      });
}
void addNotice(){
  setState(() {
   Noticepublish.add(headingController.text);
  });
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: buildPostButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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
        body: Padding(
          padding: const EdgeInsets.only(left:4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.only(top: 8.0,right: 8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: TextButton(onPressed: (){
                        setState(() {
                          
                        });
                      }, child: Text("View History",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),
                      )),
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only( right: 15, left: 15),
                child: Text(
                  "Faculty",
                  style: TextStyle(
                    color: mode ? (Colors.white) : (Colors.black),
                    fontWeight: FontWeight.w900,
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
                            icon: Align(
                              alignment: Alignment.centerRight,
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
               selectfaculty=="BSc.CSIT"?(dropDownSemester(context)):selectfaculty=="BIT"?(dropDownSemester(context)):(dropDownYear(context)),
              const SizedBox(height: 5,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: TextButton(onPressed: (){
                      setState(() {
                        Select=true;
                        addSelecteditems();
                      });
                    }, child: Text("Select",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                    ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 5
              ),
                
              const SizedBox(height: 5.0,),
              Wrap(
                spacing: 5.0,
                runSpacing: 4.0,
                children: 
                  List.generate(Selecteditems.length, (index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(Selecteditems[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                              ),
                              ),
                            ),
                            IconButton(onPressed: (){
                              setState(() {
                                Selecteditems.removeAt(index);
                              });
                            }, icon: Icon(Icons.close,color: Colors.white,))
                          ],
                        ),
                      ),
                    );
                  })
                )
            ],
          ),
        ),
      ),
    );
  }
}
