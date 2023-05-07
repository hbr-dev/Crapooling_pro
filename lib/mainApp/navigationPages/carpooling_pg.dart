import 'dart:developer';

import 'package:carpooling/mainApp/carpooling/attachedWidgets/mycarpcard_widget.dart';
import 'package:carpooling/mainApp/carpooling/attachedWidgets/myreservcard_widget.dart';
import 'package:carpooling/models/carpooling.dart';
import 'package:carpooling/models/demands.dart';
import 'package:flutter/material.dart';

import 'package:intro_slider/intro_slider.dart';

class CarpoolingPage extends StatefulWidget {
  const CarpoolingPage({Key? key}) : super(key: key);

  @override
  State<CarpoolingPage> createState() => _CarpoolingPageState();
}

class _CarpoolingPageState extends State<CarpoolingPage> {
  int navigationIndicator = 0;
  double _w = 0;
  List<ContentConfig> slides = [];

  @override
  void initState() {
    super.initState();
    // slides.add(ContentConfig(widget: reservationView()));

  }

  @override
  Widget build(BuildContext context) {
    _w = MediaQuery.of(context).size.width - 40;
    // Main Container
    return Container(
      color: const Color(0xFFF3F9F9),
      // color: Colors.red,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      // ------------------------- The Main column -------------------------//
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ########### Container 1 : the page title #############
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.green,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: (const Text(
                "Mes covoiturages",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NunitoBold',
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900),
              )),
            ),
          ),
          // ########### ############################ #############
          // ###### Container 2: in carpooling -> navigator  ######
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: (_w / 2) - 5,
                    decoration: BoxDecoration(
                        color: navigationIndicator == 0
                            ? Colors.white
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Text(
                        'Réservations',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: (_w / 2) - 5,
                    decoration: BoxDecoration(
                        color: navigationIndicator == 1
                            ? Colors.white
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Text(
                        'Offres',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // ########### ############################ #############
          // ###### Container 2: in carpooling > navigation  ######
          Expanded(
            flex: 10,
            child: Container(
              // color: Colors.purple,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              // child: reservationView(),
              child: IntroSlider(
                listCustomTabs: [reservationView(), offersView()],
                backgroundColorAllTabs: const Color(0xFFF3F9F9),
                isAutoScroll: false,
                isShowSkipBtn: false,
                isShowNextBtn: false,
                isShowDoneBtn: false,
                isLoopAutoScroll: false,
                isPauseAutoPlayOnTouch: false,
                isShowPrevBtn: false,
                // Behavior
                scrollPhysics: const BouncingScrollPhysics(),
                onTabChangeCompleted: onTabChangeCompleted,
              ),
            ),
          )
        ],
      ),
      // ------------------------- *************** -------------------------//
    );
  }

// ===========================================================================//
// ===========================================================================//
// ===========================================================================//
// ===========================================================================//
  void onTabChangeCompleted(index) {
    log("onTabChangeCompleted, index: $index");
    setState(() {
      navigationIndicator = index;
    });
  }

  Widget reservationView() {
    List reservations = Demands.myDemands;
    return Container(
      // color: Colors.cyan,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: SingleChildScrollView(
          child: reservations.isEmpty
            ? Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.hourglass_empty,
                            size: 45,
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 2.5),
                      child: const Text(
                        "Pas des réservations en cours",
                        style: TextStyle(
                            fontFamily: 'NunitoMedium',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 5),
                      child: const Text(
                          "Tes futures réservations apparaîtront ici.",
                          style: TextStyle(
                              fontFamily: 'NunitoRegular',
                              fontSize: 16.0,
                              color: Colors.black54,
                              letterSpacing: 1.5)),
                    )
                  ],
                ),
              )
            : Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(var i=0; i<reservations.length; i++)
                    MyReservationCard(reservations[i])
                ],
              ),
            ),
          ),
      )
    );
  }


  Widget offersView() {
    List myOffers = Carpooling().myCarpoolings();
    return Container(
      // color: Colors.cyan,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
        child: SingleChildScrollView(
          child: myOffers.isEmpty
          ? Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.hourglass_empty,
                        size: 45,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 2.5),
                  child: const Text(
                    "Pas d'offres en cours",
                    style: TextStyle(
                        fontFamily: 'NunitoMedium',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 5),
                  child: const Text(
                    "Tes offres publiées s'afficheront ici.",
                    style: TextStyle(
                      fontFamily: 'NunitoRegular',
                      fontSize: 16.0,
                      color: Colors.black54,
                      letterSpacing: 1.5
                    )
                  ),
                )
              ],
            ),
          )
          : Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(var i=0; i<myOffers.length; i++)
                    MyCarpoolingCard(myOffers[i])
                ],
              ),
            ),
          )
        )
    );
  }
}
