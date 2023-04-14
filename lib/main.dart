import 'dart:math';

import 'package:camera/camera.dart';
import 'package:carpooling/connection/home.dart';
import 'package:carpooling/connection/login.dart';
import 'package:carpooling/connection/signup.dart';
import 'package:carpooling/mainApp/id_verification/examiner.dart';
import 'package:carpooling/mainApp/id_verification/info.dart';
import 'package:carpooling/mainApp/id_verification/verifyID.dart';
import 'package:carpooling/mainApp/main_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  bool isAuth = false;
  // SharedPreferences localStorage = await SharedPreferences.getInstance();
  // var token = localStorage.getString('token');
  //
  // if(token != null){
  //     isAuth = true;
  //     print('this is the $token from the main');
  // } else {
  //   print('No bariar token got!');
  // }

  runApp(
    MaterialApp(
      initialRoute: isAuth==false ? '/' : '/main/home',
      routes: {
        '/': (context) => const ConnectionHome(),
        '/signup': (context) => const SignUp(),
        '/login': (context) => const Login(),
        '/main/home': (context) => const MainHome(),
        '/main/verifyID/info': (context) => const AboutVerificationInfo(),
        '/main/verifyID/selectPiece': (context) => const VerifyID(),
        '/main/verifyID/examiner': (context) => IDExaminer(camera: firstCamera),
      },
    ),
  );
}
