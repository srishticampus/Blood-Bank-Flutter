import 'package:animate_do/animate_do.dart';
import 'package:blood_bank_application/API/EmergencyalertAPI/emergencyapi/Emergencyrequestprovider.dart';
import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/DashBoard/widgets/dashboradcard.dart';
import 'package:blood_bank_application/DashBoard/widgets/donarcard.dart';
import 'package:blood_bank_application/DashBoard/widgets/emergencycard.dart';
import 'package:blood_bank_application/DashBoard/widgets/oraganizationcard.dart';
import 'package:blood_bank_application/Drawer/drawer.dart';
import 'package:blood_bank_application/Screens/Blood_donation_request/blood_donation_request.dart';
import 'package:blood_bank_application/Screens/DonationHistory/donationhistoryscreen.dart';
import 'package:blood_bank_application/Screens/Profile/profilescreen.dart';
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
    Provider.of<Emergencyrequestprovider>(context,listen: false).getAllEmergencyRequestData(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final emergencyalert=Provider.of<Emergencyrequestprovider>(context);
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

                 SizedBox(
                  height: size.height*0.25,
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

              SizedBox(height: size.height*0.01),
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
                        Emergencycard(
                            icon: Icons.location_city_outlined,
                            value:
                                'Organization Name : Blood Bank Organization'),
                        Emergencycard(
                            icon: Icons.person_pin_outlined,
                            value: 'Count of Members : 50'),
                        Emergencycard(
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
