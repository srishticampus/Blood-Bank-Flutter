import 'package:blood_bank_application/Colors/colors.dart';
import 'package:blood_bank_application/Screens/Images/images.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonarCard extends StatefulWidget {
  const DonarCard({
    Key? key,
  }) : super(key: key);

  @override
  State<DonarCard> createState() => _DonarCardState();
}

class _DonarCardState extends State<DonarCard> {
  void initState(){
    Provider.of<UserProvider>(context,listen: false).getUserData(context: context);
    super.initState();
  }
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
                  title:   Consumer<UserProvider>(builder: (context, value, child) {
                  String username= "";
                  for (var i = 0; i < value.users.length; i++) {
                    username = value.users[i].fullName;
                   
                  }
                  return  Text('Donar Name : ${username}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),);
                  
                }),
                  subtitle:  Consumer<UserProvider>(builder: (context, value, child) {
                  String userrole= "";
                  for (var i = 0; i < value.users.length; i++) {
                    userrole = value.users[i].role;
                   
                  }
                  return  Text('Role : ${userrole}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey),);
                  
                }),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child:  Consumer<UserProvider>(builder: (context, value, child) {
                  String userblood= "";
                  for (var i = 0; i < value.users.length; i++) {
                    userblood = value.users[i].bloodGroup;
                   
                  }
                  return  Text(
                    'Blood Group : ${userblood}',
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.w500),
                  );
                  
                }),
                  // child: Text(
                  //   'Blood Group : ${'O+'}',
                  //   style: TextStyle(
                  //       color: Colors.grey[800], fontWeight: FontWeight.w500),
                  // ),
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
