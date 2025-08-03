import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Profile/Profilepage.dart';
import 'package:teachers/Theme/theme_provider.dart';
class educationalinfo extends StatefulWidget {
  const educationalinfo({super.key});

  @override
  State<educationalinfo> createState() => _educationalinfoState();
}

class _educationalinfoState extends State<educationalinfo> {
  void _showAddEducationDialogBox(BuildContext context){
  final _formkey=GlobalKey<FormState>();
  final degreeController=TextEditingController();
  final institutionController=TextEditingController();
  final yearController=TextEditingController();
  final gradeController=TextEditingController();
final yearRegExp = RegExp(r'^(19[7-9]\d|20[0-1]\d|202[0-4])$');

  showDialog(context: context, builder:(context)=>AlertDialog(
    backgroundColor: mode?(primarygrey):(Colors.white),
    title: Text("Add Educational Information",
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900
    ),
    ),
    content: Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: degreeController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: mode?(Colors.white):(Colors.black)
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: mode?(Colors.white):(Colors.black)
                  )
                ),
                labelText: "Degree",
                labelStyle: TextStyle(
                  color: mode?(Colors.white):(Colors.black)
                ),
              ),
              validator: (value) => (value == null || value.trim().isEmpty)?"Required":null,
            ),
            const SizedBox(height:10),
            TextFormField(
              controller: institutionController,
              decoration: InputDecoration(
                labelText: "Institution",
                labelStyle: TextStyle(
                  color: mode?(Colors.white):(Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: mode?(Colors.white):(Colors.black)
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: mode?(Colors.white):(Colors.black)
                  )
                )
              ),
              validator: (value) => (value == null || value.trim().isEmpty)?"Required":null,
            ),
            const SizedBox(height: 10),
             TextFormField(
              controller: yearController,
              decoration: InputDecoration(
                labelText: "Year",
                labelStyle: TextStyle(
                  color: mode?(Colors.white):(Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: mode?(Colors.white):(Colors.black)
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: mode?(Colors.white):(Colors.black)
                  )
                )
              ),
              validator: (value) => 
              (value == null || value.trim().isEmpty)?"Required":null,
            ),
            const SizedBox(height: 10),
             TextFormField(
              controller: gradeController,
              decoration: InputDecoration(
                labelText: "Grade",
                labelStyle: TextStyle(
                  color: mode?(Colors.white):(Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: mode?(Colors.white):(Colors.black)
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: mode?(Colors.white):(Colors.black)
                  )
                )
              ),
              validator: (value) => (value == null || value.trim().isEmpty)?"Required":null,
            ),
          ],
        ),
      ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cancel",
        style: TextStyle(
          color: mode?(Colors.white):(Colors.black)
        ),
        )),
        TextButton(onPressed: (){
          if(_formkey.currentState!.validate()){
           setState(() {
             educationList.add({
              "degree":degreeController.text.trim(),
              "institution":institutionController.text.trim(),
              "year":yearController.text.trim(),
              "grade":gradeController.text.trim(),
             });
           });
          Navigator.pop(context);

}
        }, child: Text("Add",
        style: TextStyle(
          color: mode?(Colors.white):(Colors.black)
        )))
      ],
  ));
}
  List educationList=[{
    "degree":"M.Sc. in Information Technology",
    "institution":"Tribhuvan University",
    "year":"2022",
    "grade":"Distinction"
  },
  {
    "degree":"M.Tech (CS)",
    "institution":"Pokhara University",
    "year":"2019",
    "grade":"First Division"
  }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Educational Information",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>profilePage()));
          }, icon: Icon(Icons.arrow_back),
          color: Colors.white,
          ),
        ),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10,top:10,bottom:15),
                child: Text("Education History",
                style: TextStyle(
                  color: mode?(Colors.white):(Colors.black),
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
                ),
                ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: educationList.length,
                  itemBuilder:(context,index)
                  {
                    return _buildEducationCard(educationList[index], index,(){
                      setState(() {
                        educationList.removeAt(index);
                      });
                    });
                  }
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: Text("Certifications",
                     style: TextStyle(
                    color: mode?(Colors.white):(Colors.black),
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                                  ),
                    ),
                  ),
                  const SizedBox(height:10),
                  _certificationCard(context: context, 
                  C_title: "Flutter App Development Certificate", 
                  C_subtitle: "Code IT Institute · 2023"),
                  _certificationCard(context: context, 
                  C_title: "Computer Science Teaching Methodology", 
                  C_subtitle: "Education Board Nepal · 2021"),
                  ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){
          _showAddEducationDialogBox(context);
        },
        tooltip: "Add Education",
        child: Icon(Icons.add,
        color: Colors.white,
        ),
        ),
      ),
    );
  }
}
Widget _buildEducationCard(Map<String,dynamic>education, int index,VoidCallback ondelete){
  return Card(
    color: mode?(primarygrey):(Colors.white),
    elevation: 4,
    margin: const EdgeInsets.only(bottom:10,left:10,right: 10),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(education["degree"],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
              ),
              PopupMenuButton(itemBuilder: (context)=>[
                PopupMenuItem(child: Text("Delete"),value: "delete",)
                ],
              onSelected: (value){
                if(value=="delete"){
                  ondelete();
                }
               },
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.school,
              color:mode?(Colors.white):(blueColor),
              size:18,
              ),
              const SizedBox(width:5),
              Text(education["institution"],
              style: TextStyle(
                fontWeight: FontWeight.w500
              ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
          Padding(
            padding: const EdgeInsets.only(left:2.5),
            child: Row(
              children: [
                Icon(Icons.calendar_today,
                color: mode?(Colors.white):(blueColor),
                size: 14,
                ),
                const SizedBox(width:5),
                Text(education["year"],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                )
              ],
            ),
          ),
          const SizedBox(width:20),
          Row(
            children: [
              Icon(Icons.star,
              color: mode?(Colors.white):(blueColor),
              size:16,
              ),
              const SizedBox(width:2),
              Text(education["grade"],
              style: TextStyle(
                fontWeight:FontWeight.w500,
              ),
              )
            ],
          )
            ]
          )
        ],
        ),
    ),
  );
}
Widget _certificationCard({
  required BuildContext context,
  required C_title,
  required C_subtitle,
  }){
  return Card(
    margin:const EdgeInsets.only(bottom:10,left:10,right: 10),
    elevation: 4,
    color: mode?(primarygrey):(Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      leading: Icon(Icons.verified,
      color: mode?(Colors.white):(blueColor),
      ),
      title: Text(C_title,
      style: TextStyle(
        fontSize:16,
        fontWeight: FontWeight.w900
      ),
      ),
      subtitle: Text(C_subtitle),
    ),
  );
}
