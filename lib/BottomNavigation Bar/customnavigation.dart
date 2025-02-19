

import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/DashBoard/dashboardscreen.dart';
import 'package:blood_bank_application/Drawer/drawer.dart';

import 'package:blood_bank_application/Screens/Images/navigationicons.dart';
import 'package:flutter/material.dart';

class Customnavigation extends StatefulWidget {
  const Customnavigation({super.key});

  @override
  State<Customnavigation> createState() => _CustomnavigationState();
}

class _CustomnavigationState extends State<Customnavigation> {
  bool iscolor=false;
  int selectedIndex=0;
  void onTapped(int index){
    setState(() {
      selectedIndex=index;
    });
  }
  List<Widget>navigationPage=[
   Dashboardscreen(),
   Text('Profile'),
   Text('Profile'),
  

Text('Profile')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //     iconTheme: IconThemeData(color: Colors.white),
      //   backgroundColor: appColor,
      //   title: Image.asset(applogo,scale: 6,color: Colors.white,),
      // ),
      drawer: DrawerMenu(),
      body: navigationPage[selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration:  BoxDecoration(
          color: backgroundColor
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),border: Border.all(color: appColor)),
          height: 60,
         
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              customButton(homeicon,'Home',0),
              customButton(bloodicon,'Donate',1),
              customButton(profileicon,'Profile',2),
              customButton(settingsicon, 'Settings',3)
              ],
            ),
          ),

        ),
        

      ),
    );
  }
  Widget customButton(String image, String title,int index) {
     bool isSelected = selectedIndex == index;
    return Column(
      children: [
        InkWell(
          onTap: () {
          onTapped(title=='Home'?0:title=='Donate'?1:title=='Profile'?2:3);
          },
          child: Image.asset(image,height: 25,width: 25,color: isSelected?appColor:Colors.grey)),
        Text(

          title,
          style: TextStyle(color:isSelected?appColor:Colors.grey,fontSize: 10,fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
