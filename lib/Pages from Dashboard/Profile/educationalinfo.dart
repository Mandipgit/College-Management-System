import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Profile/Profilepage.dart';
import 'package:teachers/Theme/theme_provider.dart';

class educationalinfo extends StatefulWidget {
  const educationalinfo({super.key});

  @override
  State<educationalinfo> createState() => _educationalinfoState();
}

class _educationalinfoState extends State<educationalinfo> {
  List educationList=[{
    "degree":"M.Sc. in Information Technology",
    "institution":"Tribhuvan University",
    "year":"2022",
    "grade":"distinction"
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
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10,top:10,bottom:18),
              child: Text("Education History",
              style: TextStyle(
                color: mode?(Colors.white):(Colors.black),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
              ),
              ),
              const SizedBox(height:5),
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
                )
          ],
        ),
      ),
    );
  }
}
Widget _buildEducationCard(Map<String,dynamic>education, int index,VoidCallback ondelete){
  return Card(
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
                fontWeight: FontWeight.w800,
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
          )
        ],
      ),
    ),
  );
}