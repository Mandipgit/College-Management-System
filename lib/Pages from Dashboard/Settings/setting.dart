import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Theme/theme_provider.dart';

bool language=false;
bool darkModeButton=false;
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String dropDownval1 = "Light Mode"; 
  String dropDownval2 = "English";
  String dropDownval3="ON";
  bool manage_accounts=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: !language?(Text(
            "Setting",
            style: TextStyle(color: Colors.white),
          )):(Text(
            "सेटिङ",
            style: TextStyle(color: Colors.white),
          )),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary, 
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Dashboardpage()),
              );
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color:  Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                        children: [
                          const Icon(Icons.palette, color: Colors.white), 
                          const SizedBox(width: 10),
                          !language?(Text(
            "Theme",
            style: TextStyle(color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )):(Text(
            "विषयवस्तुको रङ",
            style: TextStyle(color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )),
                        ],
                      ),
                        TextButton(onPressed: (){
                        setState(() {
                           Provider.of<ThemeProvider>(context,listen:false).toggleTheme();
                        });    
                        }, 
                        child:Text("Change",
                        style: TextStyle(
                          color:mode?(Colors.white):(Colors.black) 
                        ),
                        ))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
               Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color:  greyColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                        children: [
                          const Icon(Icons.language, color: Colors.black), 
                          const SizedBox(width: 10),
                          !language?(Text(
            "Language",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )):(Text(
            "भाषा",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )),
                        ],
                      ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                          value: dropDownval2, 
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                          style: const TextStyle(color: Colors.black), 
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownval2 = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: "English",
                              child: GestureDetector(
                                child: Row(
                                  children: const [
                                   Text("EN",
                                   style:TextStyle(
                                    fontWeight: FontWeight.w900,
                                   )
                                   ),
                                    SizedBox(width: 10),
                                    Text("English"),
                                  ],
                                ),
                                onTap: (){
                                  setState(() {
                                    language=false;
                                  });
                                },
                              ),
                            ),
                           DropdownMenuItem(
                              value: "नेपाली",
                              child: GestureDetector(
                                child: Row(
                                  children: const [
                                    Text("NP",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900
                                    ),),
                                    SizedBox(width: 10),
                                    Text("नेपाली"),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    language=true;
                                  });
                                },
                              ),
                            ),
                          ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color:  greyColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                        children: [
                          const Icon(Icons.notifications, color: Colors.black), 
                          const SizedBox(width: 10),
                          !language?(Text(
            "Notification",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )):(Text(
            "सूचना",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )),
                        ],
                      ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                          value: dropDownval3, 
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                          style: const TextStyle(color: Colors.black), 
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownval3 = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: "ON",
                              child: GestureDetector(
                                child: Row(
                                  children: const [
                                    Icon(Icons.lightbulb, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text("ON"),
                                  ],
                                ),
                                onTap: (){},
                              ),
                            ),
                           DropdownMenuItem(
                              value: "OFF",
                              child: GestureDetector(
                                child: Row(
                                  children: const [
                                    Icon(Icons.highlight_off, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text("OFF"),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                                                ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: !manage_accounts?(greyColor):(secBlueColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13,vertical:16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.manage_accounts),
                        const SizedBox(width: 10,),
                        !language?(Text(
            "Manage Account",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )):(Text(
            "खाता व्यवस्थापन गर्नुहोस्",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    manage_accounts=!manage_accounts;
                  });
                },
              ),
            if(manage_accounts)
              Column(
                children: [
                  const SizedBox(height: 10,),
                GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blueGrey[100],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.people),
                        const SizedBox(width: 10,),
                        !language?(Text(
            "Change Username",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )):(Text(
            "प्रयोगकर्ता नाम परिवर्तन गर्नुहोस्",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                 
                },
              ),
              const SizedBox(height: 10),
              GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blueGrey[100],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.password),
                        const SizedBox(width: 10,),
                        !language?(Text(
            "Change Password",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )):(Text(
            "पासवर्ड परिवर्तन गर्नुहोस्",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  
                },
              ),
               const SizedBox(height: 10,),
             GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blueGrey[100],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.numbers),
                        const SizedBox(width: 10,),
                        !language?(Text(
            "Add or Remove Phone Number",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )):(Text(
            "फोन नम्बर थप्नुहोस् वा हटाउनुहोस्",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                 
                },
              ),
              const SizedBox(height: 10,),
               GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blueGrey[100],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.email),
                        const SizedBox(width: 10,),
                        !language?(Text(
            "Add or Remove Email",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )):(Text(
            "ईमेल थप्नुहोस् वा हटाउनुहोस्",
            style: TextStyle(color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
          )),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                 
                },
              ),
              ],),
           ],
          ),
        ),
      ),
    );
  }
}
