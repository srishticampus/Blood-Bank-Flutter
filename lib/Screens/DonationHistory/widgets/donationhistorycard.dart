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
  Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
       child: Padding(
         padding: const EdgeInsets.all(15.0),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 135, 101, 99),
              radius: 25,
              child: Text('A+',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
           
                Text('David Hospital'),
                SizedBox(height: 5),
                 Row(
                   children: [
                     Icon(Icons.person_outline,size: 15,),
                     SizedBox(width: 5),
                     Text('Eligibility : 20Years',style: TextStyle(fontSize: 12),),
                   ],
                 ),  SizedBox(height: 5),
                  Row(
                    children: [
                       Icon(Icons.calendar_month_outlined,size: 15,),
                          SizedBox(width: 5),
                      Text('12-7-2000',style: TextStyle(fontSize: 12),),
                    ],
                  )
              ],
            ),
            Card(
              color: Colors.grey[200],
            
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('10 Units',style: TextStyle(fontSize: 12),),
              ),
            )
          ],
         ),
       ),
        
        
      ),
    );
  }
}
