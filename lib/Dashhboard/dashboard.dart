import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/Bottomsheet.dart';
import 'package:teachers/Pages%20from%20Dashboard/Profilepage.dart';
import 'package:teachers/Pages%20from%20Dashboard/Settings/setting.dart';
import 'package:teachers/Pages%20from%20Dashboard/notificationPage.dart';
import 'package:teachers/main.dart';

Color blueColor = Color(0xFF274C77);
Color greyColor = Color.fromARGB(255, 228, 224, 224);
Color secBlueColor = Color(0xFF5D7DAC);
void main() {
  runApp(MyApp());
}

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}
class _DashboardpageState extends State<Dashboardpage> {
  // Color blueColor = Color(0xFF274C77);
  // Color greyColor = Color.fromARGB(255, 228, 224, 224);
  bool iconChecked = false;
  bool isFABpressed = false;

  Widget buildChatButton() {
    return !isFABpressed
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 50,
            ),
            child: FloatingActionButton(
                backgroundColor: blueColor,
                child: Icon(
                  (Icons.chat),
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isFABpressed = !isFABpressed;
                  });
                }),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 150,
                  width: 180,
                  child: FloatingActionButton.extended(
                      backgroundColor: blueColor,
                      foregroundColor: Colors.white,
                      label: Column(
                        children: [
                          SizedBox(
                            width: 180,
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.family_restroom,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  !language?("Parents"):("अभिभावक"),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 180,
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.school,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  !language?("Teachers"):("शिक्षक"),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 180,
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.admin_panel_settings,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  !language?("Administration"):("प्रशासन"),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          )
                        ],
                      ),
                      onPressed: () {}),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                    backgroundColor: blueColor,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        isFABpressed = false;
                      });
                    }),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: buildChatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        backgroundColor: greyColor,
        appBar: AppBar(
          title: !language?(Text(
            "Teacher",
            style: TextStyle(color: Colors.white),
          )):(Text(
            "शिक्षक",
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: blueColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Notificationpage()));
                  });
                },
                icon: Icon(Icons.notifications))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: blueColor,
                ),
                accountName: Text(
                  !language?("Mandeep Pokharel"):("मन्दिप पोखरेल"),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                accountEmail: Text("mandippokharel456@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 100,
                  child: SizedBox(
                    width: 100,
                    child: GestureDetector(
                      child: ClipOval(
                        child: Image.asset(
                          "Assets/sleepyDiet.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => profilePage()));
                      },
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(
               !language?("Profile"):("प्रोफाइल"),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text(
                 !language?("Notification"):("सूचना"),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.policy),
                title: Text(
                  !language?("Policies"):("नीतिहरू"),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                 !language?("Setings"):("सेटिङहरू"),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SettingPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text(
                   !language?("LogOut"):("लगआउट"),
                  style:
                      TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
                ),
                onTap: () {},
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(
                   !language?("About Us"):("हाम्रो बारेमा"),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Container(
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(!language?("Hello Mandip"):("नमस्ते मन्दिप"),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            )),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            !iconChecked
                                ? Container(
                                    height: 40,
                                    width: 213,
                                    decoration: BoxDecoration(
                                      color: blueColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                         !language?("Mark Your Attendance"):("हाजिर गर्नुहोस्"),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 0),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              iconChecked = !iconChecked;
                                            });
                                          },
                                          icon: Icon(Icons.add_box_outlined),
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    height: 40,
                                    width: 213,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: greyColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        !language?("Attendance Done"):("हाजिरी सकियो"),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: blueColor,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CircleAvatar(
                        radius: 50,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipOval(
                            child: Image.asset(
                              'Assets/sleepyDiet.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Color(0xFF5D7DAC),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 20),
                        child: Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFF5D7DAC),
                           
                          ),
                          child: Text(
                            !language?("Explore Categories"):("वर्गहरू छान्नुहोस्"),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: greyColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Image.asset(
                                          'Assets/assignment.png',
                                          height: 80,
                                        ),
                                      ),
                                      Text(
                                        !language?("Assignment"):("असाइनमेन्ट"),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  showBottomSheetAssignment(context);
                                },
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              GestureDetector(
                                  child: Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Image.asset(
                                            'Assets/student.png',
                                            height: 80,
                                          ),
                                        ),
                                        Text(
                                          !language?("Student"):("विद्यार्थी"),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    showBottomSheetStudent(context);
                                  }),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'Assets/publishnotice.png',
                                        height: 80,
                                      ),
                                    ),
                                    Text(
                                      !language?("Publish Notice"):("सुचना प्रकाशन"),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'Assets/library.png',
                                        height: 80,
                                      ),
                                    ),
                                    Text(
                                       !language?("Library"):("पुस्तकालय"),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(
                                        'Assets/meeting.png',
                                        height: 80,
                                      ),
                                    ),
                                    Text(
                                     !language?("Meeting"):("बैठक"),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
