import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/material.dart';


class Donationhistorycard extends StatelessWidget {
  const Donationhistorycard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          
          Card(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),side: BorderSide(color: appColor,width: 3)),
            
            elevation: 2,
           // margin: const EdgeInsets.all(26),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              ListTile(
                  leading:
                  CircleAvatar(radius: 25,backgroundColor:appColor,
                  backgroundImage: AssetImage('assets/newblood.png',),
                  
                  ),
                  title: Text('Hospital Name : PRS Hospital',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('Blood Group : A+',style: TextStyle(fontWeight: FontWeight.bold),),
                  
                
                 
                        ),
                      Text('No.of Units Taken : 10 Units',),
                        Text('Eligibility : 24 Years',),
                          Text('Last Donation Date : 12-04-2024',),
                           
         
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
