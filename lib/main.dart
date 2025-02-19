
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:blood_bank_application/Screens/Profile/profilescreen.dart';
import 'package:blood_bank_application/Screens/SpalshScreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>UserProvider())
      ],
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(Typography.blackCupertino)),
          home:Splashscreen(),
          routes: {
            '/profilescreen':(context)=>Profilescreen()
          },
        ),
     );
    
  }
}
