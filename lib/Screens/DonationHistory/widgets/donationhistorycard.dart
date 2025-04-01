import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/material.dart';


class Donationhistorycard extends StatefulWidget {
  final String id;
  final String request_id;
  final String status;
  final String bloodUnitReceived;
  final String updatedtime;
  const Donationhistorycard({
    Key? key, required this.id, required this.request_id, required this.status, required this.bloodUnitReceived, required this.updatedtime,
   
  }) : super(key: key);



  @override
  State<Donationhistorycard> createState() => _DonationhistorycardState();
}

class _DonationhistorycardState extends State<Donationhistorycard> {
  @override
  Widget build(BuildContext context) {
  Size size=MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Colors.grey[200],
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/donation_history.png'),
              
            ),
            title: Text('Request Id : ${widget.request_id}',style: TextStyle(fontSize: 14),),
            subtitle: Text('Upadte Time : ${widget.updatedtime}',style: TextStyle(fontSize: 12),),
            trailing: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              color: getStatusColor(widget.status),
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.status,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            )),
          )
        ],
      ),
    );
  }
   Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'ongoing':
        return Colors.red;
      case 'fulfilled':
        return Colors.green;
      default:
        return Colors.blueGrey; 
    }
  }
}

