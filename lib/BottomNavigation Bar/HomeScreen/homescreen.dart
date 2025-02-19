import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide.none),hintText: 'Search Donars',hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
              prefixIcon: Icon(Icons.search,color: Colors.grey),
              fillColor: Colors.white,filled: true
              ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                          
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(donarImage),fit: BoxFit.cover),borderRadius: BorderRadius.circular(5),),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('John Michel',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: size.height*0.01),
                              Text('Id: 23457',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                               SizedBox(height: size.height*0.01),
                              Text('Well Fare Organization',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold))
                            ],
                          ),
                         CircleAvatar(
                          radius: 18,
                          backgroundColor: appColor,
                          child: Text('A+',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                         )
                        ],
                      ),
                    ),
                  ),
                );
              },),
            ),
          ],
        ),
      ),
    
    );
  }
}