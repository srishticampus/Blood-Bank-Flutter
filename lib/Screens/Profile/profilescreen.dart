import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:blood_bank_application/Screens/LoginScreen/loginscreen.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:blood_bank_application/Screens/Profile/editprofilescreen.dart';
import 'package:blood_bank_application/Screens/Profile/widgets/profilecard.dart';
import 'package:blood_bank_application/Screens/Profile/widgets/subcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  void initState(){
Provider.of<UserProvider>(context,listen: false).getUserData(context: context);
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold( appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
         
          children: [
           Container(
            height: size.height*0.23,
            width: double.infinity,
            decoration: BoxDecoration(color: appColor,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
            child:  Column(
              children: [
                  Consumer<UserProvider>(builder: (context, value, child) {
                  String username = "";
                  for (var i = 0; i < value.users.length; i++) {
                    username = value.users[i].avatar;
                   
                  }
                  return  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(username),
                  );
                }),
                // Center(
                //   child: CircleAvatar(
                //     radius: 50,
                //     backgroundImage: AssetImage(donarImage),
                //   ),
        
         
                // ),  
                SizedBox(height: size.height*0.01), 
                 Consumer<UserProvider>(builder: (context, value, child) {
                  String username = "";
                  for (var i = 0; i < value.users.length; i++) {
                    username = value.users[i].fullName;
                   
                  }
                  return  Center(child: Text(username,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                  ,);
                }),
                   
         Consumer<UserProvider>(builder: (context, value, child) {
                  String username = "";
                  for (var i = 0; i < value.users.length; i++) {
                    username = value.users[i].email;
                   
                  }
                  return  Center(child: Text(username,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)
                  ,);
                }),
              ],
            ), 
           ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(
              children: [
              SizedBox(height: size.height*0.02),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                     Consumer<UserProvider>(builder: (context, value, child) {
                  String userdob = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userdob = value.users[i].dateOfBirth;
                   
                  }
                  return  Profilecard(icon: Icons.calendar_today_outlined, value: 'Date of Birth :',subvalue:userdob);
                }),
                   
                    Divider(color: Colors.grey[300],), Consumer<UserProvider>(builder: (context, value, child) {
                  String userdob = "";
                  for (var i = 0; i < value.users.length; i++) {
                    userdob = value.users[i].contactNumber;
                   
                  }
                  return  Profilecard(icon: Icons.phone_android_outlined, value: 'Mobile No :',subvalue:userdob);
                }), Divider(color: Colors.grey[300],),
                       Consumer<UserProvider>(builder: (context, value, child) {
                  String usergender = "";
                  for (var i = 0; i < value.users.length; i++) {
                    usergender = value.users[i].gender;
                   
                  }
                  return   Profilecard(icon: Icons.male_outlined, value: 'Gender :',subvalue:usergender); 
                }),
                        Divider(color:Colors.grey[300],),
                             Consumer<UserProvider>(builder: (context, value, child) {
                  String userloaction= "";
                  for (var i = 0; i < value.users.length; i++) {
                    userloaction = value.users[i].city;
                   
                  }
                  return     Profilecard(icon: Icons.my_location_outlined, value: 'City :',subvalue:userloaction);  
                  
                }), Divider(color:Colors.grey[300],),    Consumer<UserProvider>(builder: (context, value, child) {
                  String userpincode= "";
                  for (var i = 0; i < value.users.length; i++) {
                    userpincode = value.users[i].zipCode;
                   
                  }
                  return      Profilecard(icon: Icons.location_on_outlined, value: 'Pincode :',subvalue:userpincode);
                             
                  
                }),
                        
                        
                            
                    
                  ],
                ),
              ),
              SizedBox(height: size.height*0.02),
              ProfileSubcard(icon: Icons.notifications_outlined, title: 'Notifications',onTap: (){
              
              },),
               SizedBox(height: size.height*0.02),
                    ProfileSubcard(icon: Icons.person_add_outlined, title: 'Edit Profile',onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const Editprofilescreen()));
                    },),  
               SizedBox(height: size.height*0.02),
                   ProfileSubcard(icon: Icons.logout_outlined, title: 'Logout',onTap: (){
                       showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 350,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [appColor,Colors.grey]),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(12, 26),
                              blurRadius: 50,
                              spreadRadius: 0,
                              color: Colors.grey.withOpacity(.1)),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                      
                          radius: 25,
                         child: Image.asset('assets/logout.png',height: 25,width: 25,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Logout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 3.5,
                        ),
                        Text("Are you sure you want to logout?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(onPressed: (){

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                    }, child: Text('Yes',style: TextStyle(color: Colors.white),)),
                                     TextButton(onPressed: (){
                                      Navigator.pop(context);
                                     }, child: Text('No',style: TextStyle(color: Colors.white)))
                                  ],
                                ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  
                );
              });
                   },),
              ],
             ),
           )
           
        
          ],
        ),
      ),

    );
  }
}