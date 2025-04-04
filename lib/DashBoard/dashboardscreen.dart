import 'package:blood_bank_application/API/EmergencyalertAPI/emergencyapi/Emergencyrequestprovider.dart';
import 'package:blood_bank_application/API/OrganizationAPI/organizationprovider.dart';
import 'package:blood_bank_application/API/OrganizationAPI/widget/organizationwidget.dart';
import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/DashBoard/widgets/dashboradcard.dart';
import 'package:blood_bank_application/DashBoard/widgets/donarcard.dart';
import 'package:blood_bank_application/DashBoard/widgets/emergencycard.dart';
import 'package:blood_bank_application/DashBoard/widgets/oraganizationcard.dart';
import 'package:blood_bank_application/Drawer/drawer.dart';
import 'package:blood_bank_application/Screens/Blood_donation_request/blood_donation_request.dart';
import 'package:blood_bank_application/Screens/DonationHistory/donationhistoryscreen.dart';
import 'package:blood_bank_application/Screens/NotificationScreen/emptynotification.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:blood_bank_application/Screens/Profile/profilescreen.dart';
import 'package:blood_bank_application/notificationpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  @override
  void initState(){
    final user=Provider.of<UserProvider>(context,listen: false);
    Provider.of<Emergencyrequestprovider>(context,listen: false).getAllEmergencyRequestData(context: context);
    Provider.of<Organizationprovider>(context,listen: false).getAllOrganizationData(context: context, userid:user.currentUserId.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final emergencyalert=Provider.of<Emergencyrequestprovider>(context);
    final organization=Provider.of<Organizationprovider>(context);
    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: appColor,
          title: Text(
            'Dashboard',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        drawer: DrawerMenu(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   Row(
                     children: [
                      Image.asset('assets/alarm.png',height: 28,width: 28,),
                      SizedBox(width: 10),
                       Text(
                                'Emergency Alerts',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                     ],
                   ),
                          SizedBox(height: size.height*0.01),

                 SizedBox(
                  height: size.height*0.22,
                   child: emergencyalert.loadingSpinner
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: const Text("Loading")),
                              CircularProgressIndicator(
                                color:appColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                           
                            ],
                          )
                        : emergencyalert.emergency.isEmpty
                            ? Center(
                                child: Text(
                                'No Emergency Alerts...',
                                style: TextStyle(color:appColor),
                              ))
                            : SizedBox(
                                height: size.height * 0.05,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: emergencyalert.emergency.length,
                                  itemBuilder: (context, intex) {
                                    return EmergencyRequestCard(
                                      id: emergencyalert.emergency[intex].id,
                                      patientName: emergencyalert.emergency[intex].patientName,
                                      contactno: emergencyalert.emergency[intex].bystanderContactNo,
                                      bloodrequired: emergencyalert.emergency[intex].bloodType,
                                      bloodUnitsRequired:emergencyalert.emergency[intex].bloodUnitsRequired,
                                   
                                     
                                    );
                                  },
                                ),
                              ),
                 ),

              SizedBox(height: size.height*0.02),
                DonarCard(),
                      SizedBox(height: size.height*0.02),
                // SizedBox(height: size.height*0.01),
                //  SizedBox(
                //   height: size.height*0.29,
                //    child:organization.loadingSpinner
                //         ? Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Center(child: const Text("Loading")),
                //               CircularProgressIndicator(
                //                 color:appColor,
                //               ),
                //               const SizedBox(
                //                 width: 10,
                //               ),
                           
                //             ],
                //           )
                //         : organization.organization.isEmpty
                //             ? Center(
                //                 child: Column(
                //                   children: [
                //                     SizedBox(height: size.height*0.06,),
                //                     Image.asset('assets/org.png',height: 50,width: 50),
                //                      SizedBox(height: size.height*0.01,),
                //                     Text(
                //                     'No Organizations...!',
                //                     style: TextStyle(color:appColor,fontWeight: FontWeight.bold),
                //                                                   ),
                //                   ],
                //                 ))
                //             : SizedBox(
                //                 height: size.height * 0.05,
                //                 child: ListView.builder(
                //                   scrollDirection: Axis.horizontal,
                //                   itemCount: organization.organization.length,
                //                   itemBuilder: (context, intex) {
                //                     return Organizationwidget(
                //                       id: organization.organization[intex].organizationId,
                //                        name:  organization.organization[intex].name,
                //                         regno: organization.organization[intex].regNo,
                //                         contact_no: organization.organization[intex].contactNo,
                //                          email: organization.organization[intex].email,
                //                           city: organization.organization[intex].city);
                //                   },
                //                 ),
                //               ),
                //  ),
                SizedBox(
  height: size.height * 0.30,
  child: organization.loadingSpinner
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Loading")),
            CircularProgressIndicator(color: appColor),
            const SizedBox(width: 10),
          ],
        )
      : organization.organization.isEmpty
          ? Center(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.06),
                  Image.asset('assets/org.png', height: 50, width: 50),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'No Organizations...!',
                    style: TextStyle(color: appColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Column(  // Directly show the first organization without ListView
              children: organization.organization.take(3).map((org) {
                return Organizationwidget(
                  id: org.organizationId,
                  name: org.name,
                  regno: org.regNo,
                  contact_no: org.contactNo,
                  email: org.email,
                  city: org.city,
                );
              }).toList(),
            ),
),

                //  Card(
                //   elevation: 5,
                //  // color:Colors.white70,
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Column(
                //       children: [
                //         Text(
                //           'Organization details',
                //           style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         Divider(thickness: 1),
                //         Emergencycard(
                //             icon: Icons.location_city_outlined,
                //             value:
                //                 'Organization Name : Blood Bank Limited'),
                //         Emergencycard(
                //             icon: Icons.person_pin_outlined,
                //             value: 'Count of Members : 50'),
                //         Emergencycard(
                //             icon: Icons.my_location_outlined,
                //             value: 'Location : Trivandrum,India'),
                //       ],
                //     ),
                //   ),
                // ),
                  SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Dashboradcard(title: 'Notifications', image: 'assets/notificationicon.png', onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const Emptynotification()));
                       }),
                   
                       Dashboradcard(title: 'Blood Donation Request', image: 'assets/bloodicon.png', onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const BloodDonationRequestPage()));
                       }),
                      
                      ]
                    ),
                  
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          Dashboradcard(title: 'Profile management', image: 'assets/usericon.png', onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>const Profilescreen()));
                     }),
                    
                          Dashboradcard(title: 'Donation History', image: 'assets/donation.png', onTap: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>const Donationhistoryscreen()));
                     })
                 
                      
                      ],
                    ),
                        
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
