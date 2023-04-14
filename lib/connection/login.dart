import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController phoneInputController = TextEditingController();
  String initialCountry = 'TN';
  PhoneNumber number = PhoneNumber(isoCode: 'TN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F9F9),
        foregroundColor: Colors.black54,
        title: Text(''),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------ The title container ---------------------- //
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: const Text(
                'Connecter à votre compte',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontFamily: 'NunitoBold',
                  letterSpacing: 1.5
                ),
              ),
            ),
            // ----------------- The login form container ------------------ //
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ----------- Text 1 container --------- //
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Text(
                      'Quel est votre numéro de téléphone ?',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'NunitoBold',
                        fontSize: 20.0,
                        letterSpacing: 1.5
                      ),
                    ),
                  ),
                  // ------------- Text field container ----------- //
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Form(
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          countries: const ['TN'],
                          hintText: '00 000 000',
                          ignoreBlank: true,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: phoneInputController,
                          formatInput: true,
                          keyboardType:
                          const TextInputType.numberWithOptions(signed: true, decimal: true),
                          inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      )
                  ),
                  // --------------- Text 2 container ----------------- //
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Text(
                      'Nous vous enverrons un code pour vérifier ton numéro',
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 16.0,
                        fontFamily: 'NunitoRegular',
                        letterSpacing: 1.5
                      ),
                    ),
                  ),
                  // ---------------- Login btn container ------------------ //
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF01AB8E),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: TextButton(
                      onPressed: () { 
                        Navigator.pushNamed(context, '/main/home');
                      },
                      child: const Text(
                        'Connecter',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NunitoBold',
                          fontSize: 18.0
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
            // --------------- ** End login container ** ------------------- //
          ],
        ),
      ) // ----------------- ** End main container ** -------------------- //
    );
  }
}
