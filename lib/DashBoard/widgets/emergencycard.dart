import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/material.dart';

class Emergencycard extends StatelessWidget {
  final IconData icon;
  final String value;
  
  const Emergencycard({super.key, required this.icon, required this.value,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon,size: 20,color: appColor),
          SizedBox(width: 10),
          Text(value,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
         
        ],
      ),
    );
  }
}