import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Images/drawericon.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: backgroundColor
            //  gradient: LinearGradient(colors: [Colors.grey, appColor])
            ),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                otherAccountsPicturesSize: const Size(100, 100),
                decoration: BoxDecoration(color: appColor
                    // gradient: LinearGradient(colors: [Colors.grey, appColor])

                    ),
                accountName: const Text(
                  'Vishal V S',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monsterrat'),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profileImage),
                ),
                accountEmail: Text(
                  'User_2532626525635',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                )),
            menuList(totaldonaricon, 'Total Available Donars:23'),
            menuList(totaldonaricon, 'Total Successful Donations:50'),
            menuList(dprofileicon, 'Profile'),
            menuList(bloodreqicon, 'Blood Requirement'),
            menuList(bloodreqicon, 'Completed Requirement'),
            menuList(aboutusicon, 'About us'),
            menuList(contactusicon, 'Contact us'),
            menuList(notificationicon, 'Notifications'),
            menuList(blogouticon, 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget menuList(String image, String title) {
    return ListTile(
      leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                image,
                height: 30,
                width: 30,
                color: Colors.black,
              )),
            ],
          )),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 13),
      ),
    );
  }
}
