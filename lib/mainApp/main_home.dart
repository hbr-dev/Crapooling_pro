import 'dart:convert';

import 'package:carpooling/mainApp/navigationPages/carpooling_pg.dart';
import 'package:carpooling/mainApp/navigationPages/driver_pg.dart';
import 'package:carpooling/mainApp/navigationPages/passenger_pg.dart';
import 'package:carpooling/mainApp/navigationPages/wallet_pg.dart';
import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../connection/login.dart';
import '../network_utils/api.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  int pageIndex = 0;
  final navigationItems = [const PassengerPage(), const DriverPage(), const CarpoolingPage(), const WalletPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          // ##### Row : the main action of the top menu
          Container(
            color: const Color(0xFFF3F9F9),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ====================
                // User-Profile section
                Container(
                  height: 45,
                  width: 45,
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF01AB8E).withAlpha(50),
                    shape: BoxShape.circle
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/main/profile');
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Color(0xFF01AB8E),
                      size: 30,
                    ),
                  ),
                ),
                // ====================
                // Help-Chat section
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: 45,
                  width: 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEC956),
                          borderRadius: BorderRadius.circular(10),
                      ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.help_outline,
                            color: Colors.black54,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        // color: const Color(0xFFFEC956),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chat,
                            color: Colors.black54,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                )
                // ====================
              ],
            ),
          )
          // ##### ######################################
        ],
      ),
      // ------------------------ ****************** ------------------------ //
      // ------------------------  The Body Section  ------------------------ //
      body: Container(
        color: const Color(0xFFF3F9F9),
        child: navigationItems[pageIndex],
      ),
      // ------------------------ ****************** ------------------------ //
      // ---------------------- The BTM_NavBar Section ---------------------- //
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            color: Color(0xFFF3F9F9),
            border: Border(
              bottom: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
              top: BorderSide(
                  color: Colors.black26,
                  style: BorderStyle.solid,
                  width: 1
              )
            ),
        ),
        // ##### Row : the main row child of the btm menu
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      icon: Icon(
                        Icons.person,
                        size: 25,
                        color: pageIndex == 0 ? const Color(0xFF01AB8E) : Colors.black26
                      )
                  ),
                  Text(
                    'Passager',
                    style: TextStyle(
                      color: pageIndex == 0 ? const Color(0xFF01AB8E) : Colors.black26,
                      fontFamily: 'NunitoBold',
                      fontSize: 18.0
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      icon: Icon(
                          Icons.personal_injury_outlined,
                          size: 25,
                          color: pageIndex == 1 ? Color(0xFF01AB8E) : Colors.black26
                      )
                  ),
                  Text(
                    'Conducteur',
                    style: TextStyle(
                        color: pageIndex == 1 ? const Color(0xFF01AB8E) : Colors.black26,
                        fontFamily: 'NunitoBold',
                        fontSize: 18.0
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 2;
                        });
                      },
                      icon: Icon(
                          Icons.drive_eta_outlined,
                          size: 25,
                          color: pageIndex == 2 ? const Color(0xFF01AB8E) : Colors.black26
                      )
                  ),
                  Text(
                    'Covoiturage',
                    style: TextStyle(
                        color: pageIndex == 2 ? const Color(0xFF01AB8E) : Colors.black26,
                        fontFamily: 'NunitoBold',
                        fontSize: 18.0
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 3;
                        });
                      },
                      icon: Icon(
                          Icons.wallet,
                          size: 25,
                          color: pageIndex == 3 ? Color(0xFF01AB8E) : Colors.black26
                      )
                  ),
                  Text(
                    'Wallet',
                    style: TextStyle(
                        color: pageIndex == 3 ? Color(0xFF01AB8E) : Colors.black26,
                        fontFamily: 'NunitoBold',
                        fontSize: 18.0
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // ##### ########################################
      ),
      // ------------------------ ****************** ------------------------ //
    );
  }
}
