import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Profile/Profilepage.dart';
import 'package:teachers/Theme/theme_provider.dart';
bool profeditMode=false;
final _positionnameController=TextEditingController(text: "Teacher");
final _departmentnameController=TextEditingController(text: "Information Technology(IT)");
final _experiencenameController=TextEditingController(text:"10");
final _qualificationnameController=TextEditingController(text:"MSC.CSIT");
final _joindateController=TextEditingController(text: "2000-01-01");

final _professionalformKey=GlobalKey <FormState>();
class Professionalinfo extends StatefulWidget {
  const Professionalinfo({super.key});

  @override
  State<Professionalinfo> createState() => _ProfessionalinfoState();
}

class _ProfessionalinfoState extends State<Professionalinfo> {
   Future<void> _selectDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    setState(() {
      _joindateController.text = "${pickedDate.toLocal()}".split(' ')[0]; 
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Professional Information",
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
          actions: [
            IconButton(onPressed: (){
              setState(() {
                profeditMode=!profeditMode;
              });
            }, icon:Icon(profeditMode?(Icons.save):(Icons.edit)),
            color: Colors.white,),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _professionalformKey,
                    child: Column(
                      children: [
                        _buildinfoCard(
                          context:context,
                          icon:Icons.badge,
                          label:"Position",
                          controller:_positionnameController,
                        ),
                         _buildinfoCard(
                          context:context,
                          icon:Icons.apartment,
                          label:"Department",
                          controller:_departmentnameController,
                        ),
                         _buildexperienceCard(
                          context:context,
                          icon:Icons.trending_up,
                          label:"Experience",
                          controller:_experiencenameController,
                        ),
                         _buildinfoCard(
                          context:context,
                          icon:Icons.school,
                          label:"Qualification",
                          controller:_qualificationnameController,
                        ),
                        _buildDateCard(context: context, 
                        icon: Icons.calendar_today, 
                        label: "Joined Date", 
                        controller: _joindateController, 
                        onTap: ()=>_selectDate(context)
                        ),
                        const SizedBox(height: 25,),
                        
                      ],
                    )
                    ),
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:10),
                              child: Text("Achievements",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right:10),
                          child: Card(
                            color: mode?(Colors.grey):(Colors.white),
                            margin:const EdgeInsets.symmetric(vertical: 2.0),
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              title: Text("Excellence in Teaching",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                              ),
                              subtitle: Text("Awarded for exceptional dedication and performance in the classroom",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                              leading: Icon(Icons.emoji_events,
                              color: mode?(Colors.white):(secBlueColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height:5,),
                           Padding(
                          padding: const EdgeInsets.only(left: 10,right:10),
                          child: Card(
                            color: mode?(Colors.grey):(Colors.white),
                            margin:const EdgeInsets.symmetric(vertical: 2.0),
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              title: Text("Best Educator 2023",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                              ),
                              subtitle: Text("Recognized as the most impactful and inspiring teacher of the year",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                              leading: Icon(Icons.star,
                              color: mode?(Colors.white):(secBlueColor),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Widget _buildinfoCard({
  required BuildContext context,
  required IconData icon,
  required String label,
  required TextEditingController controller,
  TextInputType?keyboardType,
  int maxLines=1,
}){
  return Padding(
  padding: const EdgeInsets.only(left:10,right: 10),
  child: Card(
    color: mode?(Colors.grey):(Colors.white),
    margin: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 4,
    child:ListTile(
      leading: Icon(icon),
      title: profeditMode?
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: label,
        ),
        validator: (value){
          if(value==null || value.isEmpty){
            return 'Please enter $label';
          }
          return null;
        },
      ):
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
            style: TextStyle(
              fontSize:12,
              color: mode?(Colors.white):(Colors.black)
            ),
            ),
            const SizedBox(height: 2,),
            Text(controller.text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            )
          ],
        ),
      )
    ),
    )
  );
}
Widget _buildexperienceCard({
  required BuildContext context,
  required IconData icon,
  required String label,
  required TextEditingController controller,
  TextInputType?keyboardType,
  int maxLines=1,
}){
  return Padding(
  padding: const EdgeInsets.only(left:10,right: 10),
  child: Card(
    color: mode?(Colors.grey):(Colors.white),
    margin: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 4,
    child:ListTile(
      leading: Icon(icon),
      title: profeditMode?
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: label,
        ),
        validator: (value){
          if(value==null || value.isEmpty){
            return 'Please enter $label';
          }
          return null;
        },
      ):
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
            style: TextStyle(
              fontSize:12,
              color: mode?(Colors.white):(Colors.black)
            ),
            ),
            const SizedBox(height: 2,),
            Text(controller.text+" years",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            )
          ],
        ),
      )
    ),
    )
  );
}
Widget _buildDateCard({
  required BuildContext context,
  required IconData icon,
  required String label,
  required TextEditingController controller,
  required VoidCallback onTap,
  TextInputType?keyboardType,
  int maxLines=1,
}){
return Padding(
  padding: const EdgeInsets.only(left:10,right: 10),
  child: Card(
    color: mode?(Colors.grey):(Colors.white),
    margin: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 4,
    child:ListTile(
      leading: Icon(icon),
      title: profeditMode?
      TextFormField(
       onTap: profeditMode? onTap:null,
        readOnly: true,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: label,
        ),
        validator: (value){
          if(value==null || value.isEmpty){
            return 'Please enter $label';
          }
           return null;
        },
      ):
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
            style: TextStyle(
              fontSize:12,
              color: mode?(Colors.white):(Colors.black)
            ),
            ),
            const SizedBox(height: 2,),
            Text(controller.text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            )
          ],
        ),
      ),
      
    ),
    )
  );

}