
import 'package:blood_bank_application/Firebase/firebasemessage.dart';
import 'package:blood_bank_application/Helpers/providers.dart';
import 'package:blood_bank_application/Helpers/routes.dart';
import 'package:blood_bank_application/Screens/SpalshScreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

 
void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     MultiProvider(
      providers:multiprovider,
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(textTheme: GoogleFonts.remTextTheme()),
          home:Splashscreen(),
          routes:customRoutes, 
        ),
     );
    
  }
}
