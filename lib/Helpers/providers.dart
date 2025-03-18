import 'package:blood_bank_application/API/BloodRequestAPI/bloodrequestprovider.dart';
import 'package:blood_bank_application/API/DonationHistoryAPI/donationhistoryprovider.dart';
import 'package:blood_bank_application/API/EmergencyalertAPI/emergencyapi/Emergencyrequestprovider.dart';
import 'package:blood_bank_application/Screens/Profile/API/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => UserProvider()),
  ChangeNotifierProvider(create: (context) => Emergencyrequestprovider()),
  ChangeNotifierProvider(create: (context) => Bloodrequestprovider()),
  ChangeNotifierProvider(create: (context)=>Donationhistoryprovider()),
];
