import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';

import 'package:flutter/material.dart';

class DonarCard extends StatefulWidget {
  const DonarCard({
    Key? key,
  }) : super(key: key);

  @override
  State<DonarCard> createState() => _DonarCardState();
}

class _DonarCardState extends State<DonarCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () {
         
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.green, width: 0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: appColor,
                    backgroundImage: AssetImage(
                      donarImage,
                    ),
                  ),
                  title: Text(
                    'Donar Name : Alen Jacob',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  subtitle: Text(
                    'Donar Id :${'User1234'}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Blood Group : ${'O+'}',
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: appColor),
                  child: Center(
                    child: Text(
                      'Organization : Blood bank Organization',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
