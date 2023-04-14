import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';




class PassengerPage extends StatefulWidget {
  const PassengerPage({Key? key}) : super(key: key);

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {

  final String userName = 'Ahmed';
  static const int offerNBR = 1000;
  List<String> destinationHistory = ['Sousse-Tunis', 'Sousse-Sfax'];
  final destinationList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  TextEditingController searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      // ------------------------- The Main column -------------------------//
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ##############################
          // >>>>> The title main container
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              "$userName, où souhaites-tu voyager?",
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'NunitoBold',
                fontSize: 26.0,
                fontWeight: FontWeight.w900
              ),
            ),
          ),
          // The title main container <<<<<
          //###############################
          // >>>>> The Search bar container
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Form(
              child: Row (
                children: [
                  Expanded(
                      flex: 1,
                      child: IconButton (
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextFieldSearch(
                      label: 'Offres',
                      initialList: destinationList,
                      controller: searchFieldController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Chercher parmi $offerNBR offres',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontFamily: 'NuntioBold',
                            fontWeight: FontWeight.w900
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // The Search bar container <<<<<
          // ##############################
          // >>>>> Recent searches container
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      'Recherches récentes',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NunitoBold',
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for(var i=0; i<destinationHistory.length; i++)
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.location_pin,
                                      size: 35,
                                    )
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  destinationHistory[i],
                                  style: const TextStyle(
                                    fontFamily: 'NunitoRegular',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          )
          // Recent searches container <<<<<
          // ################################
        ],
      ),
      // ------------------------- *************** -------------------------//
    );
  }
}
