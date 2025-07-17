import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Settings/setting.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  bool setting = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            !language ? ("View Profile") : ("प्रोफाइल"),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Dashboardpage()),
              );
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          actions: [
            PopupMenuTheme(
              data: PopupMenuThemeData(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              !language ? ("LogOut") : ("लगआउट"),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipOval(
                          child: Image.asset(
                            'Assets/sleepyDiet.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Mandip Pokharel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Teacher",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.email,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text("mandippokharel456@gmail.com",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.phone,
                                      size: 15, color: Colors.white),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text("+977-9845201451",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Overview",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  showpopOver(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(
            color: blueColor,
          ),
          child: Text(
            "Logout",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
