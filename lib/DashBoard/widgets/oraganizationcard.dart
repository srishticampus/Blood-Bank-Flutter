import 'package:blood_bank_application/DashBoard/widgets/emergencyalertdetails.dart';
import 'package:blood_bank_application/DashBoard/widgets/emergencycard.dart';
import 'package:flutter/material.dart';

class EmergencyRequestCard extends StatefulWidget {
  final String id;
  final String patientName;
  final String contactno;
  final String bloodrequired;
  final String bloodUnitsRequired;
  const EmergencyRequestCard({super.key, required this.id, required this.patientName, required this.contactno, required this.bloodrequired, required this.bloodUnitsRequired,});

  @override
  State<EmergencyRequestCard> createState() => _EmergencyRequestCardState();
}

class _EmergencyRequestCardState extends State<EmergencyRequestCard> {
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Emergencyalertdetails(id: widget.id)));
      },
      child: Card(
                    elevation: 5,
                    //  color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         
                            Divider(thickness: 1,color: Colors.black,),
                            Emergencycard(
                                icon: Icons.person,
                                value: 'Patient Name : ${widget.patientName}'),
                            Emergencycard(
                                icon: Icons.phone_android,
                                value: 'Contact No : ${widget.contactno}'),
                            Emergencycard(
                                icon: Icons.bloodtype,
                                value: 'Blood Required : ${widget.bloodrequired}'),
                            Emergencycard(
                                icon: Icons.bloodtype,
                                value: 'Units Required : ${widget.bloodUnitsRequired}'),
                          ],
                        ),
                      )),
    );
  }
}