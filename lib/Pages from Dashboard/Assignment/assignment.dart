import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Theme/theme_provider.dart';
final titlecontroller=TextEditingController();
final descriptioncontroller=TextEditingController();
final datecontroller=TextEditingController();
final assignmentformkey=GlobalKey<FormState>();

class assignmentPage extends StatefulWidget {
  final String faculty;
  final String Semester;
  final String Year;
  const assignmentPage(
      {required this.faculty, required this.Semester, required this.Year});

  @override
  State<assignmentPage> createState() => _assignmentPageState();
}

class _assignmentPageState extends State<assignmentPage> {
    Future<void> _selectDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    setState(() {
      datecontroller.text = "${pickedDate.toLocal()}".split(' ')[0]; 
    });
  }
}
  FilePickerResult? result;
  String? filename;
  PlatformFile? pickedfile;
  File? filetodisplay;
  pickFile() async {
    try {
      result = await FilePicker.platform.pickFiles(
       type: FileType.custom,
  allowMultiple: false,
  allowedExtensions: ['jpg', 'png', 'pdf', 'doc', 'docx'],
      );
      if (result != null) { 
        filename = result!.files.first.name;
        pickedfile = result!.files.first;
        setState(() {
          filetodisplay = File(pickedfile!.path.toString());
        });
      }
    } catch (e) {
      print("e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Assignment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Dashboardpage()));
              });
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: assignmentformkey,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Center(
                  child: Text(
                    (widget.faculty == "BSc.CSIT" || widget.faculty == "BIT")
                        ? "${widget.faculty} (${widget.Semester})"
                        : "${widget.faculty} (${widget.Year})",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height:10),
            Padding(
                         padding: const EdgeInsets.only(left:15),
                         child: Text("Assignment Title",
                         style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: mode?(Colors.white):(Colors.black)
                         ),
                         ),
                       ),
                       const SizedBox(height:5,),
                       Padding(
                         padding: const EdgeInsets.only(left:15,right:15),
                         child: TextFormField(
                          controller:titlecontroller,
                          maxLines: 1,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: mode?(Colors.white):(Colors.black)
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: mode?(Colors.white):(Colors.black)
                              )
                            )
                          ),
                         ),
                       ),
                       const SizedBox(height:10),
                        Padding(
                         padding: const EdgeInsets.only(left:15),
                         child: Text("Assignment Description",
                         style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: mode?(Colors.white):(Colors.black)
                         ),
                         ),
                       ),
                        const SizedBox(height:5,),
                       Padding(
                         padding: const EdgeInsets.only(left:15,right:15),
                         child: TextFormField(
                          controller:descriptioncontroller,
                          maxLines: 3,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: mode?(Colors.white):(Colors.black)
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: mode?(Colors.white):(Colors.black)
                              )
                            )
                          ),
                         ),
                       ),
                       const SizedBox(height:10),
                       Column(
                         children: [
                          if (filetodisplay != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.file(
                              filetodisplay!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height:5,),
                           Padding(
                             padding: const EdgeInsets.only(left:15),
                             child: Container(
                              height:35,
                              width: 101,
                              decoration: BoxDecoration(
                                color:mode?(primarygrey):(Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(
                                  color: mode?(primarygrey):(Colors.black),
                                )
                              ),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                  Icon(Icons.attach_file,
                                  size: 20,
                                  ),
                                   TextButton(onPressed: pickFile, 
                                   child:Text("Attach File",
                                   style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: mode?(Colors.white):(Colors.black),
                                   ),
                                   )
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                       const SizedBox(height:10),
                         Padding(
                           padding: const EdgeInsets.only(left:15,right:15),
                           child: Row(
                             children: [
                               Text("Due Date",
                               style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: mode?(Colors.white):(Colors.black)
                               ),
                               ),
                               Expanded(
                                 child: Padding(
                                   padding: const EdgeInsets.only(left:8),
                                   child: TextFormField(
                                                               controller:datecontroller,
                                                               readOnly: true,
                                                               maxLines: 1,
                                                               decoration: InputDecoration(
                                                                hintText: "YYYY-MM-DD",
                                                                hintStyle: TextStyle(
                                                                  color: mode?(Colors.white):(Colors.black)
                                                                ),
                                                                 focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: mode?(Colors.white):(Colors.black)
                                    )
                                                                 ),
                                                                 enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: mode?(Colors.white):(Colors.black)
                                    )
                                                                 )
                                                               ),
                                                               onTap: () {
                                                                 _selectDate(context);
                                                               },
                                                              ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                        ],
        ),
      ),
    );
  }
}
