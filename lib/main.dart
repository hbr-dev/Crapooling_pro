import 'package:camera/camera.dart';
import 'package:carpooling/connection/home.dart';
import 'package:carpooling/connection/login.dart';
import 'package:carpooling/connection/signup.dart';
import 'package:carpooling/mainApp/carpooling/attachedInterfaces/confiramtion_interface.dart';
import 'package:carpooling/mainApp/carpooling/attachedInterfaces/demands_interface.dart';
import 'package:carpooling/mainApp/carpooling/main_details.dart';
import 'package:carpooling/mainApp/road/roadMain.dart';
import 'package:carpooling/mainApp/id_verification/examiner.dart';
import 'package:carpooling/mainApp/id_verification/info.dart';
import 'package:carpooling/mainApp/id_verification/verifyID.dart';
import 'package:carpooling/mainApp/loading.dart';
import 'package:carpooling/mainApp/main_home.dart';
import 'package:carpooling/models/user.dart';
import 'package:carpooling/profile/profile_sts.dart';
import 'package:carpooling/profile/profile_view.dart';
import 'package:carpooling/profile/user_alerts.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString('token');

  if(token != null){
      User.isAuth = true;
  } else {
    print('No bariar token got!');
  }

  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': User.isAuth == false ? (context) => const ConnectionHome() : (context) => const Loading(),
        '/signup': (context) => const SignUp(),
        '/login': (context) => const Login(),
        '/loading': (context) => const Loading(),
        '/main/home': (context) => const MainHome(),
        '/main/profile': (context) => const MyProfile(),
        '/main/profile/sts': (context) => const ProfileSTS(),
        '/main/profile/alerts': (context) => const UserAlerts(),
        '/main/addCarpooling': (context) => const RoadMain(),
        '/main/carpoolingDemands': (context) => const CarpoolingDemands(),
        '/main/carpoolingDetails': (context) => const CarpoolingMainDetails(),
        '/main/confirmCarpooling': (context) => const ConfirmCarpooling(),
        '/main/verifyID/info': (context) => const AboutVerificationInfo(),
        '/main/verifyID/selectPiece': (context) => const VerifyID(),
        '/main/verifyID/examiner': (context) => IDExaminer(camera: firstCamera),
      },
    ),
  );
}
