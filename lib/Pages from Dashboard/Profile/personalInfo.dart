import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Profile/Profilepage.dart';
import 'package:teachers/Theme/theme_provider.dart';
bool editMode=false;
final _formKey=GlobalKey <FormState>();
final _firstnamecontroller=TextEditingController();
final _lastnamecontroller=TextEditingController();
final _emailcontroller=TextEditingController();
final _addresscontroller=TextEditingController();
class Personalinfo extends StatefulWidget {
  const Personalinfo({super.key});

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Personal Information",
          style: TextStyle(
            color: Colors.white,
              fontWeight: FontWeight.w900,
          ),),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => profilePage()),
              );
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                editMode=!editMode;
              });
            }, icon:Icon(editMode?Icons.save:Icons.edit),color: Colors.white,)
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
               children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 25),
                    child: CircleAvatar(
                              radius: 45,
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
                  ),
                ),
                _buildFormCard(
                  context: context,
                  icon:Icons.person,
                  label:"Firstname",
                  controller:_firstnamecontroller,
                )
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}
Widget _buildFormCard({
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
    margin: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 4,
    child:ListTile(
      leading: Icon(Icons.person),
      title: editMode?
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
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
      )
    ),
    )
  );

}