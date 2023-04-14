import 'package:flutter/material.dart';



class AboutVerificationInfo extends StatefulWidget {
  const AboutVerificationInfo({Key? key}) : super(key: key);

  @override
  State<AboutVerificationInfo> createState() => _AboutVerificationInfoState();
}

class _AboutVerificationInfoState extends State<AboutVerificationInfo> {
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
              // color: Colors.red,
              // width: MediaQuery.of(context).size.width - 40,
              child: Image.asset(
                'images/id.png',
                width: 215,
                height: 215,
                alignment: Alignment.center,
              ),
            ),
            // ########### Container 2 #############
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: const Text(
                "Il semble que votre profil n'est pas encore vérifié",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'NunitoBold',
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
            // ########### Container 3 #############
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: const Text(
                "Pour des raisons de sécurité, tout conducteur doit avoir un profil vérifié avant de publier une offre. Merci de nous soumettre une photo d'une des pièce d'identité suivantes pour une vérification rapide.",
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'NunitoBold',
                    fontSize: 20.0
                ),
              ),
            ),
            // ########### Container 4 #############
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              decoration: BoxDecoration(
                color: const Color(0xFF01AB8E),
                borderRadius: BorderRadius.circular(25)
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/main/verifyID/selectPiece');
                },
                child: const Text(
                  "Continuer",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NunitoBold',
                      fontSize: 20.0
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // ------------------------ ****************** ------------------------ //
    );
  }
}
