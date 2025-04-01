import 'package:blood_bank_application/API/BloodRequestAPI/bloodrequestprovider.dart';
import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BloodDonationdetailsscreen extends StatefulWidget {
   static const routeName = 'blood_donation_details';
  final String id;
  const BloodDonationdetailsscreen({super.key,required this.id});

  @override
  State<BloodDonationdetailsscreen> createState() => _BloodDonationdetailsscreenState();
}

class _BloodDonationdetailsscreenState extends State<BloodDonationdetailsscreen> {
  

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
     final bloodrequest=Provider.of<Bloodrequestprovider>(context);
      final user=Provider.of<UserProvider>(context);
    
      final bloodData =
        Provider.of<Bloodrequestprovider>(context).bloodrequest.firstWhere((element) => element.id == widget.id);
      
      

    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appColor,
        title: Text('Blood Request Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
       ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Card(
             
                margin:const EdgeInsets.all(10),
              
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Blood Request Details',style: TextStyle(color: appColor,fontWeight: FontWeight.bold),),
                    SizedBox(height: size.height*0.01,),
                    Card(
                      color:Colors.grey[300],
                     
                       child: Padding(
                         padding: const EdgeInsets.all(15),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 const Expanded(
                                   flex: 2,
                                   child: Text('Patient Name  :',style: TextStyle(fontWeight: FontWeight.w600),)),
                                 Expanded(
                                   flex: 2,
                                   child: Text(bloodData.patientName,style:const TextStyle(fontWeight: FontWeight.w600),))
                               ],
                             ),
                             SizedBox(height: size.height*0.02,),
                              Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 const Expanded(
                                   flex: 2,
                                   child: Text('Mr no  :',style: TextStyle(fontWeight: FontWeight.w600),)),
                                 Expanded(
                                   flex: 2,
                                   child: Text(bloodData.mrNo,style:const TextStyle(fontWeight: FontWeight.w600),))
                               ],
                             ),
                               SizedBox(height: size.height*0.02,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 const Expanded(
                                   flex: 2,
                                   child: Text('By Stander Name  :',style: TextStyle(fontWeight: FontWeight.w600),)),
                                 Expanded(
                                   flex: 2,
                                   child: Text(bloodData.bystanderName,style:const TextStyle(fontWeight: FontWeight.w600),))
                               ],
                             ),
                              SizedBox(height: size.height*0.02,),
                                Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 const Expanded(
                                   flex: 2,
                                   child: Text('By Stander Conatct No  :',style: TextStyle(fontWeight: FontWeight.w600),)),
                                 Expanded(
                                   flex: 2,
                                   child: Text(bloodData.bystanderContactNo,style:const TextStyle(fontWeight: FontWeight.w600),))
                               ],
                             ),
                           
                           ],
                         ),
                         
                       ),
                    ),
                    Card(
                      color: appColor,
                                     
                                           child: Padding(
                                             padding: EdgeInsets.all(15),
                                             child: Column(
                                               children: [
                                                 Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text('Blood Type :',style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600),)),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(bloodData.bloodType,style:TextStyle(color:Colors.white,fontWeight: FontWeight.w600),))
                                                    ],
                                                  ),
                                                    SizedBox(height: size.height*0.02,),
                                                   Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                       Expanded(
                                                        flex: 2,
                                                        child: Text('Blood Units Required :',style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600),)),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(bloodData.bloodUnitsRequired,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),))
                                                    ],
                                                  ),
                                               ],
                                             ),
                                           ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             const Expanded(
                               flex: 2,
                               child: Text('Diagnosis  :',style: TextStyle(fontWeight: FontWeight.w600),)),
                             Expanded(
                               flex: 2,
                               child: Text(bloodData.diagnosis,style:const TextStyle(fontWeight: FontWeight.w600),))
                           ],
                                            ),
                    SizedBox(height: size.height*0.02,),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         const Expanded(
                           flex: 2,
                           child: Text('Doctor Assigned  :',style: TextStyle(fontWeight: FontWeight.w600),)),
                         Expanded(
                           flex: 2,
                           child: Text(bloodData.doctorAssigned,style:const TextStyle(fontWeight: FontWeight.w600),))
                       ],
                                            ),
                    SizedBox(height: size.height*0.02,),
                   
                                            Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         const Expanded(
                           flex: 2,
                           child: Text('Priority   :',style: TextStyle(fontWeight: FontWeight.w600),)),
                         Expanded(
                           flex: 2,
                           child: Text(bloodData.priority,style:const TextStyle(fontWeight: FontWeight.w600),))
                       ],
                                            ),
                    SizedBox(height: size.height*0.02,),
                                            Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         const Expanded(
                           flex: 2,
                           child: Text('Requested Date  :',style: TextStyle(fontWeight: FontWeight.w600),)),
                         Expanded(
                           flex: 2,
                           child: Text(bloodData.requestedDate,style:const TextStyle(fontWeight: FontWeight.w600),))
                       ],
                                            ),
                                              SizedBox(height: size.height*0.04,),
                                            Center(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: appColor),
                                                onPressed: ()async{
                                                await bloodrequest.donationInterest(donorId: user.currentUserId.toString(), requestId: bloodData.id.toString(), context: context);
                                                print(user.currentUserId.toString());
                                                print(bloodData.id.toString());

                                                }, child: Text('Interst',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),)),
                                            )
                                    
                  
                                          
                        ],
                      ),
                                            
                    )
                 
                   
                  ],
                ),
              ),
              
              
              
              
              ),
              
            ],
          ),
          
        ),
        
        
        
        
      ),
    );
  }
}