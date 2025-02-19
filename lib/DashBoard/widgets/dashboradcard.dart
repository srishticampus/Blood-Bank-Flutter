import 'package:blood_bank_application/Colors/colors.dart';
import 'package:flutter/material.dart';


class Dashboradcard extends StatelessWidget {
  final String title;
  final String image;
  final Function() onTap;
  
  Dashboradcard({
    Key? key,
    required this.title,
    required this.image,
 
    required this.onTap,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
        flex: 2,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            GestureDetector(
              onTap: () {
                onTap();
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: appColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                image,
                                width: 35,
                                height: 35,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, top: 8, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                               
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
           
          ],
        ));
  }
}
