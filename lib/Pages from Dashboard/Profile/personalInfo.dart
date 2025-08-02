import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Pages%20from%20Dashboard/Profile/Profilepage.dart';
import 'package:teachers/Theme/theme_provider.dart';


bool editMode=false;
final _personalformKey=GlobalKey <FormState>();
final _firstnamecontroller=TextEditingController(text:"Mandeep");
final _lastnamecontroller=TextEditingController(text:"Pokharel");
final _emailcontroller=TextEditingController(text: "mandippokharel456@gmail.com");
final _addresscontroller=TextEditingController(text: "Arjundhara-14,Jhapa");
final _phonecontroller=TextEditingController(text: "9845201451");
final _dobController=TextEditingController(text:"2000-01-01");
String  name= "${_firstnamecontroller.text} ${_lastnamecontroller.text}";
String firstname1=_firstnamecontroller.text;
class Personalinfo extends StatefulWidget {
  const Personalinfo({super.key});
  

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  // String  name= "";
  Future<void> _selectDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    setState(() {
      _dobController.text = "${pickedDate.toLocal()}".split(' ')[0]; 
    });
  }
}
@override
void initState(){
  super.initState();
  name="${_firstnamecontroller.text} ${_lastnamecontroller.text}";
  firstname1=_firstnamecontroller.text;
  _firstnamecontroller.addListener(_updateName);
  _lastnamecontroller.addListener(_updateName);
}
void _updateName(){
setState(() {
  name="${_firstnamecontroller.text} ${_lastnamecontroller.text}";
  firstname1="${_firstnamecontroller.text}";
});
}

  
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
                MaterialPageRoute(builder: (context) => profilePage(name:"${_firstnamecontroller} ${_lastnamecontroller}",firstname:_firstnamecontroller.text,)),
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
                  key: _personalformKey,
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
                ),
                _buildFormCard(
                  context: context,
                  icon:Icons.person,
                  label:"Lastname",
                  controller:_lastnamecontroller,
                ),
                _buildEmailCard(
                  context: context,
                  icon:Icons.email,
                  label:"Email",
                  controller:_emailcontroller,
                ),
                _buildPhoneCard(
                  context: context,
                  icon:Icons.phone_rounded,
                  label:"Phone Number",
                  controller:_phonecontroller,
                ),
                _buildFormCard(
                  context: context,
                  icon:Icons.house,
                  label:"Address",
                  controller:_addresscontroller,
                ),
                _buildDateCard(context: context, icon: Icons.calendar_month, label: "Date Of Birth", controller: _dobController, onTap: ()=>_selectDate(context)),
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
    color: mode?(primarygrey):(Colors.white),
    margin: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 4,
    child:ListTile(
      leading: Icon(icon),
      title: editMode?
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
Widget _buildEmailCard({
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
    color: mode?(primarygrey):(Colors.white),
    margin: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 4,
    child:ListTile(
      leading: Icon(icon),
      title: editMode?
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
           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
              return 'Enter a valid email address';
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
Widget _buildPhoneCard({
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
    color: mode?(primarygrey):(Colors.white),
    margin: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 4,
    child:ListTile(
      leading: Icon(icon),
      title: editMode?
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
           if (!RegExp(r'^\d{7,15}$').hasMatch(value)) {
              return 'Enter a valid number';
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
    color: mode?(primarygrey):(Colors.white),
    margin: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 4,
    child:ListTile(
      leading: Icon(icon),
      title: editMode?
      TextFormField(
       onTap: editMode? onTap:null,
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
