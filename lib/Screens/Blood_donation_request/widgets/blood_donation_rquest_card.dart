import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/material.dart';


class AllEventWidget extends StatefulWidget {
 
 
  

  const AllEventWidget(
      {super.key,
   
     
      });

  @override
  State<AllEventWidget > createState() => _AllEventWidgetState();
}

class _AllEventWidgetState extends State<AllEventWidget> {
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
     return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                        
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          color: Colors.grey[200],
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                   
                                   
                                    Text(
                                      'Patient Name : Alen Jacob',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Contact No : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                    Text('0987654321',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
                                  ],
                                ),
                                  Text(
                                      'Blood Type : O+',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Units Required : 10 Units',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Status : Approved',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    color: appColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: size.height * 0.03,
                                        width: size.width * 0.32,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(40),
                                              topRight: Radius.circular(40)),
                                          color: Colors.white,
                                        ),
                                        child: const Center(
                                            child: Text(
                                          '10.00 PM',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Date : 11-17-2023',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                  SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Card(
                                      color:  const Color.fromARGB(255, 50, 123, 52),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('Accept',style: TextStyle(color: Colors.white),),
                                      ), 
                                    ),                                 
                                    SizedBox(width: size.width*0.03,),
                                       Card(
                                      color:  const Color.fromARGB(255, 195, 39, 28),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('Reject',style: TextStyle(color: Colors.white),),
                                      ), 
                                    ),

                                     
                                  ],
                                ),

                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
     
    
  }
}
