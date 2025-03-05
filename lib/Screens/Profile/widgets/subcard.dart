import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/material.dart';

class ProfileSubcard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const ProfileSubcard({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return   InkWell(
      onTap:onTap ,
      child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: appColor,
                          child: Icon(icon,color: Colors.white)),
                        SizedBox(width: size.width*0.05),
                        Text(title,style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )),
    );
  }
}