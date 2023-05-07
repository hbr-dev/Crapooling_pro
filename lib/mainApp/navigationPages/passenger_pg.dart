import 'dart:developer';

import 'package:carpooling/mainApp/carpooling/attachedWidgets/card_widget.dart';
import 'package:carpooling/mainApp/carpooling/attachedWidgets/custom_filter_dialog_view.dart';
import 'package:carpooling/mainApp/carpooling/filter.dart';
import 'package:carpooling/models/carpooling.dart';
import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:textfield_search/textfield_search.dart';




class PassengerPage extends StatefulWidget {
  const PassengerPage({Key? key}) : super(key: key);

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {

  TextEditingController searchFieldController = TextEditingController();
  CarpoolingsFilter carpoolingsFilter = CarpoolingsFilter();
  List carpoolingsListToDisplay = CarpoolingsFilter.filteredList;
  late List _stations;

  @override
  void initState() {
    super.initState();
    searchFieldController.addListener(() {
      log('Log from passenger_pg > searchField : ${searchFieldController.text}');
      if(searchFieldController.text.contains('-')){
        _stations = searchFieldController.text.split('-');
      }
      else{
        _stations = ['', ''];
      }
      carpoolingsFilter.updateFilteredList(_stations[0], _stations[1]);
      setState(() {
        carpoolingsListToDisplay = CarpoolingsFilter.filteredList;
      });
    });
  }

  // @override
  // void dispose() {
  //   searchFieldController.dispose();
  //   super.dispose();
  // }


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
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "${User.firstname}, où souhaites-tu voyager?",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'NunitoBold',
                  fontSize: 26.0,
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
          ),
          // The title main container <<<<<
          //###############################
          // >>>>> The Search bar container
          Expanded(
            flex: 1,
            child: Container(
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
                        initialList: Carpooling.availableDestinations,
                        controller: searchFieldController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Chercher une detination',
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
          ),
          // The Search bar container <<<<<
          // ##############################
          // >>>>> All available carpoolings
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // The title of this part
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Covoiturages disponibles',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'NunitoBold',
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _displayFilterDialog();
                          },
                          icon: const Icon(
                            Icons.filter_alt_sharp,
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                    // The main column for this part
                    carpoolingsListToDisplay.isEmpty == true
                    ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.hourglass_empty,
                          size: 45,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Aucun covoiturage disponible pour le ${CarpoolingsFilter.dateFilter}',
                          style: const TextStyle(
                            color: Colors.black26,
                            fontFamily: 'NunitoMedium',
                            fontSize: 18.0
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                    :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for(var i=0; i<CarpoolingsFilter.filteredList.length; i++)
                          CarpoolingCard(CarpoolingsFilter.filteredList[i])
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
          // All available carpoolings <<<<<
          // ################################
        ],
      ),
      // ------------------------- *************** -------------------------//
    );
  }


  void _displayFilterDialog(){
    Dialogs.materialDialog(
        context: context,
        customView: const CustomFilterDialogView(),
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.of(context).pop();
              log('Log From Passenger > FilterDialog : priceFilter : ${CarpoolingsFilter.priceFilter}');
              log('Log From Passenger > FilterDialog : dateFilter : ${CarpoolingsFilter.dateFilter}');
            },
            text: 'Annuler',
            iconData: Icons.cancel_outlined,
            textStyle: const TextStyle(
                fontFamily: 'NunitoBold',
                color: Colors.black87
            ),
            iconColor: Colors.redAccent,
            color: Colors.white,
          ),
          TextButton(
            onPressed: (){
              carpoolingsFilter.commitFilteredList();
              setState(() {
                carpoolingsListToDisplay = CarpoolingsFilter.filteredList;
              });
              Navigator.of(context).pop();
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black12)
            ),
            child: const Text(
              'Appliquer',
              style: TextStyle(
                  fontFamily: 'NunitoBold',
                  color: Colors.black54
              ),
            ),
          )
        ]
    );
  }

}
