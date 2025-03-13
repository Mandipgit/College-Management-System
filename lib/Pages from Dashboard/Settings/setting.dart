import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';

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
          title: const Text(
            "Setting",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: blueColor, // Assuming `blueColor` is missing
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
                color:  greyColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                        children: [
                          const Icon(Icons.palette, color: Colors.black), 
                          const SizedBox(width: 10),
                          const Text(
                            'Theme',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                          value: dropDownval1, 
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                          style: const TextStyle(color: Colors.black), // Ensure visibility
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownval1 = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: "Dark Mode",
                              child: GestureDetector(
                                child: Row(
                                  children: const [
                                    Icon(Icons.dark_mode, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text("Dark Mode"),
                                  ],
                                ),
                                onTap: (){},
                              ),
                            ),
                           DropdownMenuItem(
                              value: "Light Mode",
                              child: GestureDetector(
                                child: Row(
                                  children: const [
                                    Icon(Icons.light_mode, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text("Light Mode"),
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
                          const Text(
                            'Language',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
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
                                onTap: (){},
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
                          const Text(
                            'Notifiation',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                          value: dropDownval3, 
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                          style: const TextStyle(color: Colors.black), // Ensure visibility
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
                  color: greyColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13,vertical:16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.manage_accounts),
                        const SizedBox(width: 10,),
                        Text("Manage Account",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )
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
                        Text("Change Username",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )
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
                        Text("Change Password",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )
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
                        Text("Add or Remove Phone Number",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )
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
                        Text("Add or Remove Email",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )
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
