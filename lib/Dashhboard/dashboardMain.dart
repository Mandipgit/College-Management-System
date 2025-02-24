import 'package:flutter/material.dart';
import 'package:teachers/Pages/notificationPage.dart';
import 'package:teachers/main.dart';

void main() {
  runApp(MyApp());
}

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  Color blueColor = Color(0xFF167AFA);
  Color greyColor = Color.fromARGB(255, 228, 224, 224);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher"),
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
        width: MediaQuery.of(context).size.width * 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: blueColor,
                )),
            // const SizedBox(height:10),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: greyColor,
              ),
              child: ListTile(),
            )
          ],
        ),
      ),
    );
  }
}
