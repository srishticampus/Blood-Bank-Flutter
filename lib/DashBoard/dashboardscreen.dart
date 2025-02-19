import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/DashBoard/widgets/dashboradcard.dart';
import 'package:blood_bank_application/DashBoard/widgets/donarcard.dart';
import 'package:blood_bank_application/DashBoard/widgets/oraganizationcard.dart';
import 'package:blood_bank_application/Drawer/drawer.dart';
import 'package:blood_bank_application/Screens/Blood_donation_request/blood_donation_request.dart';
import 'package:blood_bank_application/Screens/DonationHistory/donationhistoryscreen.dart';
import 'package:blood_bank_application/Screens/Profile/profilescreen.dart';
import 'package:flutter/material.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  @override
  Widget build(BuildContext context) {
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
              //  Center(child: Image.asset(applogo, scale: 5)),
                Card(
                  elevation: 5,
                  //  color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            'Emergency Alert',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(thickness: 1),
                          Oraganizationcard(
                              icon: Icons.person_outline,
                              value: 'Patient Name : Vishal V S'),
                          Oraganizationcard(
                              icon: Icons.phone_android_outlined,
                              value: 'Contact No : 8870120688'),
                          Oraganizationcard(
                              icon: Icons.bloodtype_outlined,
                              value: 'Blood Required : A+'),
                          Oraganizationcard(
                              icon: Icons.bloodtype_outlined,
                              value: 'Units Required : 10 Units'),
                        ],
                      ),
                    )), SizedBox(height: size.height*0.01),
                DonarCard(),
                SizedBox(height: size.height*0.01),
                 Card(
                  elevation: 5,
                 // color:Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Organization details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(thickness: 1),
                        Oraganizationcard(
                            icon: Icons.location_city_outlined,
                            value:
                                'Organization Name : Blood Bank Organization'),
                        Oraganizationcard(
                            icon: Icons.person_pin_outlined,
                            value: 'Count of Members : 50'),
                        Oraganizationcard(
                            icon: Icons.my_location_outlined,
                            value: 'Location : Trivandrum,India'),
                      ],
                    ),
                  ),
                ),
                  SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    
                     Dashboradcard(title: 'Profile management', image: 'assets/usericon.png', onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>const Profilescreen()));
                     }),
                       Dashboradcard(title: 'Blood Donation Request', image: 'assets/bloodicon.png', onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const BloodDonationRequestPage()));
                       }),
                      
                      ]
                    ),
                  
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Dashboradcard(title: 'Appointment Request', image: 'assets/appoin.png', onTap: (){}),
                       Dashboradcard(title: 'Notifications', image: 'assets/notificationicon.png', onTap: (){}),
                      
                      ],
                    ),
                        
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Dashboradcard(title: 'Donation History', image: 'assets/donation.png', onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>const Donationhistoryscreen()));
                       }),
                       Dashboradcard(title: 'Logout', image: 'assets/logout.png', onTap: (){
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
                                    TextButton(onPressed: (){}, child: Text('Yes',style: TextStyle(color: Colors.white),)),
                                     TextButton(onPressed: (){}, child: Text('No',style: TextStyle(color: Colors.white)))
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
                       }),
                      
                      ],
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
