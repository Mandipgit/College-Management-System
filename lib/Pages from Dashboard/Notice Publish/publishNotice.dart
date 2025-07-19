import 'dart:io';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/viewHistory.dart';
import 'package:teachers/Theme/theme_provider.dart';


String selectfaculty = "BSc.CSIT";
String selectSemester = "1st Sem";
String selectYear = "1st Year";
bool Select = false;
bool Publish = false;
bool isPublished = false;


final List<String> faculties = [
  'BSc.CSIT',
  'BIT',
  'B.Tech',
  'BND',
  'Physics',
  'Geology'
];
final List<String> Semester = [
  '1st Sem',
  '2nd Sem',
  '3rd Sem',
  '4th Sem',
  '5th Sem',
  '6th Sem',
  '7th Sem',
  '8th Sem'
];
final List<String> Year = ['1st Year', '2nd Year', '3rd Year', '4th Year'];
final List<String> Selecteditems = [];
final List<String> listHeading = [];
final List<String> listNotice = [];
final List<String> Noticepublish = [];

var headingController = TextEditingController();
var noticeController = TextEditingController();

class publishNotice extends StatefulWidget {
  
  const publishNotice({super.key});

  @override
  State<publishNotice> createState() => _publishNoticeState();
}

class _publishNoticeState extends State<publishNotice> {
  void addSelecteditems() {
    setState(() {
      String selectedText = (selectfaculty == "BSc.CSIT")
          ? ("$selectfaculty($selectSemester)")
          : (selectfaculty == "BIT")
              ? ("$selectfaculty($selectSemester)")
              : ("$selectfaculty($selectYear)");
      if (!Selecteditems.contains(selectedText)) {
        Selecteditems.add(selectedText);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    headingController.addListener(checkTextFields);
    noticeController.addListener(checkTextFields);
  }

  void checkTextFields() {
    setState(() {
      isPublished =
          headingController.text.isNotEmpty && noticeController.text.isNotEmpty;
    });
  }

  dropDownSemester(BuildContext context) {
    return Column(
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
                    dropdownColor: mode ? (Colors.grey[900]) : (greyColor),
                    value: selectSemester,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectSemester = newValue!;
                      });
                    },
                    items: Semester.map((String semester) {
                      return DropdownMenuItem<String>(
                        value: semester,
                        child: Text(
                          semester,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.outline),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )),
        )
      ],
    );
  }

  dropDownYear(BuildContext context) {
    return Column(
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
                    dropdownColor: mode ? (Colors.grey[900]) : (greyColor),
                    value: selectYear,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectYear = newValue!;
                      });
                    },
                    items: Year.map((String Year) {
                      return DropdownMenuItem<String>(
                        value: Year,
                        child: Text(
                          Year,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.outline),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )),
        )
      ],
    );
  }

  void addNotice() {
    setState(() {
      Noticepublish.add(headingController.text);
    });
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => viewHistory(
                                            heading: headingController.text,
                                            notice: noticeController.text,
                                            faculty: Selecteditems,
                                             fileName: filename ?? '',
                                            filePath: filetodisplay?.path ?? '',
                                            fileExtension: pickedfile?.extension ?? '',
                                          )));
                            });
                          },
                          child: Text(
                            "View History",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
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
                            dropdownColor:
                                mode ? (Colors.grey[900]) : (greyColor),
                            value: selectfaculty,
                            icon: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectfaculty = newValue!;
                              });
                            },
                            items: faculties.map((String faculty) {
                              return DropdownMenuItem<String>(
                                value: faculty,
                                child: Text(
                                  faculty,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                selectfaculty == "BSc.CSIT"
                    ? (dropDownSemester(context))
                    : selectfaculty == "BIT"
                        ? (dropDownSemester(context))
                        : (dropDownYear(context)),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mode ? (primarygrey) : (Colors.blueGrey),
                      ),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              Select = true;
                              addSelecteditems();
                            });
                          },
                          child: Text(
                            "Select",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  height: 5.0,
                ),
                IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Wrap(
                        spacing: 5.0,
                        runSpacing: 4.0,
                        children: List.generate(Selecteditems.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              height: 40,
                              width: 185,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      Selecteditems[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Selecteditems.removeAt(index);
                                          Select = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                  child: IntrinsicHeight(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Heading For Notice",
                            style: TextStyle(
                              color: Select
                                  ? (mode ? (Colors.white) : (Colors.black))
                                  : (Colors.grey[700]),
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          TextField(
                            enabled: Select ? (true) : (false),
                            controller: headingController,
                            maxLines: 1,
                            decoration: InputDecoration(
                                hintText: "Write Heading for Notice..",
                                filled: true,
                                fillColor:
                                    mode ? (primarygrey) : (Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      width: 2,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      width: 2,
                                    ))),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Text(
                            "Write Notice",
                            style: TextStyle(
                              color: Select
                                  ? (mode ? (Colors.white) : (Colors.black))
                                  : (Colors.grey[700]),
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          TextField(
                            enabled: Select ? (true) : (false),
                            controller: noticeController,
                            maxLines: 5,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    mode ? (primarygrey) : (Colors.white),
                                hintText: "Type Here",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      width: 2,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      width: 2,
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
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
                        const SizedBox(
                  height: 15,
                ),
                      Container(
                        height: 40,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: TextButton(
                            onPressed: pickFile,
                            child: Text(
                              "Upload File",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 31,
                ),
                Center(
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: TextButton(
                        onPressed: Select
                            ? (isPublished
                                ? (() {
                                    setState(() {
                                      DateTime now = DateTime.now();
                                      addNotice();
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (context) => viewHistory(
                                                    heading:
                                                        headingController.text,
                                                    notice:
                                                        noticeController.text,
                                                    faculty: Selecteditems,
                                                     fileName: filename ?? '',
  filePath: filetodisplay?.path ?? '',
  fileExtension: pickedfile?.extension ?? '',
                                                  )));
                                                  
                                    });
                                  })
                                : (null))
                            : (null),
                        child: Text(
                          "Publish",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
