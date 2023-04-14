import 'package:flutter/material.dart';


class VerifyID extends StatefulWidget {
  const VerifyID({Key? key}) : super(key: key);

  @override
  State<VerifyID> createState() => _VerifyIDState();
}

class _VerifyIDState extends State<VerifyID> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'X',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NunitoMedium',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  )
              )
            ],
          )
        ],
      ),
      // ------------------------ ****************** ------------------------ //
      // ---------------------- Main Container Section ---------------------- //
      body: Container(
        color: const Color(0xFFF3F9F9),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ########### Container 1 #############
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: const Text(
                "Selectionner une pièce d'identité pour continuer",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'NunitoBold',
                  fontSize: 34.0,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            // ########### Container 2 #############
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Row for the ID Card verification        //
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF546E6A),
                        )
                    ),
                    // color: Colors.red,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main/verifyID/examiner', arguments: {
                          'verificationMethod' : 0
                        });
                      },
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.credit_card_sharp,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                          const Text(
                            "Vérification par CIN",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'NunitoRegualr',
                                fontSize: 18.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ******************************************
                  // Row for the Driven License verification //
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF546E6A),
                      )
                    ),
                    // color: Colors.red,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main/verifyID/examiner', arguments: {
                          'verificationMethod' : 1
                        });
                      },
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.credit_card_sharp,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                          const Text(
                            "Vérification par permis",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'NunitoRegualr',
                                fontSize: 18.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ******************************************
                  // Row for the Passport verification       //
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF546E6A),
                        )
                    ),
                    // color: Colors.red,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main/verifyID/examiner', arguments: {
                          'verificationMethod' : 2
                        });
                      },
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.credit_card_sharp,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                          const Text(
                            "Vérification avec le passeport",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'NunitoRegualr',
                                fontSize: 18.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
            // ******************************************
          ],
        ),
      ),
      // ------------------------ ****************** ------------------------ //
    );
  }
}
