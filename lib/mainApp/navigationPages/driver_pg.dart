import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';



class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {

  // final String userName = 'Ahmed';
  var verifiedUserID = User.isIDVerified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              '${User.firstname}, tu voyages quelque part?',
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'NunitoBold',
                  fontSize: 26.0,
                  fontWeight: FontWeight.w900
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
              color: const Color(0xFF01AB8E),
              borderRadius: BorderRadius.circular(25)
            ),
            child: TextButton(
              onPressed: () {
                verifiedUserID == 0 ? Navigator.pushNamed(context, '/main/addCarpooling') : Navigator.pushNamed(context, '/main/verifyID/info');
              },
              child: const Text(
                '+ Publier un covoiturage',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'NunitoBold',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
