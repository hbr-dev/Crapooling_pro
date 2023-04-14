import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network_utils/api.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController dateInputController = TextEditingController();
  final List<Map<String, dynamic>> gender = [
    {
      'value': 'man',
      'label': 'Homme'
    },
    {
      'value': 'woman',
      'label': 'Femme'
    }
  ];

  final TextEditingController phoneInputController = TextEditingController();
  String initialCountry = 'TN';
  PhoneNumber number = PhoneNumber(isoCode: 'TN');
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  String _gndr = 'man';
  TextEditingController _email = TextEditingController();

  // var firstName = '';
  // var lastName = '';
  // var email = '';
  // var birthDate = '';
  // var gndr = '';
  // var phoneNBR = '';
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F9F9),
        foregroundColor: Colors.black54,
        title: const Text(''),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.redAccent,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: const Text(
                  'Informations personnelles',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontFamily: "NunitoBold",
                      letterSpacing: 1.5
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: const Text(
                            'Prénom',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: "NunitoBold",
                                letterSpacing: 1.5),
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: const Text(
                              'Nom de famille',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "NunitoBold",
                                  letterSpacing: 1.5)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: _firstName,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Votre prénom',
                                hintStyle: TextStyle(
                                    fontFamily: 'NunitoRegular',
                                    fontSize: 12.0,
                                    color: Colors.black26
                                )
                            ),
                            validator: (firstNameValue) {
                              if (firstNameValue == null || firstNameValue.isEmpty) {
                                return 'Champ obligatoire';
                              }
                              // firstName = firstNameValue;
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            controller: _lastName,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Votre nom',
                                hintStyle: TextStyle(
                                    fontFamily: 'NunitoRegular',
                                    fontSize: 12.0,
                                    color: Colors.black26)
                            ),
                            validator: (lastnameValue) {
                              if (lastnameValue == null || lastnameValue.isEmpty) {
                                return 'Champ obligatoire';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 300,
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: const Text(
                            "Assure-toi qu'ils correspondent à ta carte d'identité",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'NunitoRegular',
                                fontSize: 14.0,
                                letterSpacing: 1.5
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          // color: Colors.green,
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: const Text(
                            'Date de naissance',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: "NunitoBold",
                                letterSpacing: 1.5
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: DateFormat('dd/MM/yyyy')
                                  .format(DateTime.now()),
                              border: const OutlineInputBorder(),
                            ),
                            controller: dateInputController,
                            readOnly: true,
                            onTap: () async {
                              var pickedDate = await DatePicker.showSimpleDatePicker(
                                context,
                                initialDate: DateTime(1994),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2012),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.fr,
                                looping: true,
                              );
                              if (pickedDate != null) {
                                dateInputController.text =
                                    DateFormat('dd/MM/yyyy').format(pickedDate);
                              }
                            },
                            validator: (birthdateValue) {
                              if (birthdateValue == null || birthdateValue.isEmpty) {
                                return 'Champ obligatoire';
                              }
                              // birthDate = birthdateValue;
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: const Text(
                            "Tu dois avoir  au moins 18 ans pour utiliser l'application. Ta date de naissance restera confidentielle",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'NunitoRegular',
                                fontSize: 14.0,
                                letterSpacing: 1.5),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          // color: Colors.green,
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: const Text(
                            'Genre',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: "NunitoBold",
                                letterSpacing: 1.5
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: SelectFormField(
                            type: SelectFormFieldType.dropdown, // or can be dialog
                            initialValue: 'man',
                            items: gender,
                            onChanged: (value) => {
                                _gndr = value
                            },
                            validator: (genderValue) {
                              if(genderValue == null || genderValue.isEmpty){
                                return 'Champ obligatoire';
                              }
                            },
                          )
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: const Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: "NunitoBold",
                                letterSpacing: 1.5
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _email,
                            decoration: const InputDecoration(
                              hintText: 'Votre valide mail',
                              hintStyle: TextStyle(
                                  fontFamily: 'NunitoRegular',
                                  fontSize: 12.0,
                                  color: Colors.black26
                              ),
                              border: OutlineInputBorder(),
                            ),
                            validator: (mailValue) {
                              if (mailValue == null || mailValue.isEmpty) {
                                return 'Champ obligatoire';
                              }
                              if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mailValue)){
                                return 'E-mail non valide';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: const Text(
                            "Assure-toi que le mail est valide pour ne rater aucune information importante sur tes covoiturages.",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'NunitoRegular',
                                fontSize: 14.0,
                                letterSpacing: 1.5
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: const Text(
                            'Téléphone',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: "NunitoBold",
                                letterSpacing: 1.5
                            ),
                          ),
                        ),
                        Container(
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            countries: const ['TN'],
                            hintText: 'N° TEL',
                            ignoreBlank: true,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: const TextStyle(color: Colors.black),
                            initialValue: number,
                            textFieldController: phoneInputController,
                            formatInput: true,
                            keyboardType:
                            const TextInputType.numberWithOptions(signed: true, decimal: true),
                            inputBorder: const OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                            validator: (phoneValue) {
                              if (phoneValue == null || phoneValue.isEmpty) {
                                return 'Champ obligatoire';
                              }
                              if( !RegExp(r"^[2459]").hasMatch(phoneValue)){
                                return 'Nombre de téléphone non valide';
                              }
                              if(phoneValue.length != 10){
                                return 'Nombre de téléphone doit avoir 8 chiffres';
                              }
                              return null;
                            },
                          )
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: const Text(
                            "Assure-toi que le numéro du télèphone est valide pour valider votre compte.",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'NunitoRegular',
                                fontSize: 14.0,
                                letterSpacing: 1.5
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                          child: TextButton(
                            onPressed: () {
                              signup();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF01AB8E),
                            ),
                            child: Text(
                              _isLoading == true ? 'En cours ...' : 'Sauvegarder',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'NunitoBold',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signup() async {
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return;
    }
    setState(() {
      _isLoading = true;
    });
    var data = {
      'firstName': _firstName.text,
      'lastName': _lastName.text,
      'birthDate': dateInputController.text,
      'gender': _gndr,
      'email': _email.text,
      'phoneNBR': phoneInputController.text
    };
    print(data);
    var res = await Network().authData(data, '/register');
    var body = json.decode(res.body);
    print('Body of res : $body');
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      print('User sucessfully added');
    }
    else{
      print('Body of res : $body');
    }
    setState(() {
      _isLoading = false;
    });
  }

}
