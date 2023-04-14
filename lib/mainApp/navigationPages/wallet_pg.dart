import 'package:flutter/material.dart';




class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

  double amount = 0.50;
  List transactions = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F9F9),
      // color: Colors.red,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      // ------------------------- The Main column -------------------------//
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ########### Container 1 : the page title #############
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Wallet",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NunitoBold',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF01AE90),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.monetization_on,
                            color: Color(0xFFFEC956),
                            size: 35,
                          )
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            '+ $amount DNT',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'NunitoBold',
                                fontSize: 28.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // ########### ############################ #############
          // ############ Container 2 : Wallet actions  ###########
          Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: const [
                        Icon(
                          Icons.account_balance_wallet,
                          size: 35,
                          color: Colors.black45,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Recharger ma wallet',
                          style: TextStyle(
                            fontFamily: 'NunitoBold',
                            color: Colors.black,
                            fontSize: 18.0
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: const [
                        Icon(
                          Icons.account_balance,
                          size: 35,
                          color: Colors.black45,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Ajouter mon RIB',
                          style: TextStyle(
                              fontFamily: 'NunitoBold',
                              color: Colors.black,
                              fontSize: 18.0
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // ########### ############################ #############
          // ######### Container 2 : Transactions history #########
          Container(
            margin: const EdgeInsets.fromLTRB(0, 25, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Listes des transactions',
                  style: TextStyle(
                    fontFamily: 'NunitoBold',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: transactions.isEmpty
                         ?Center(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.hourglass_empty,
                          color: Colors.black45,
                          size: 40
                        ),
                        Text(
                          'Aucune transaction trouvée',
                          style: TextStyle(
                            fontFamily: 'NunitoBold',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5
                          ),
                        ),
                        Text(
                          "L'ensemble de tes",
                          style: TextStyle(
                            color: Colors.black38,
                            fontFamily: 'NunitoRegular',
                            fontSize: 18.0,
                            letterSpacing: 1.5
                          ),
                        ),
                        Text(
                          "transactions apparîtront ici",
                          style: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'NunitoRegular',
                              fontSize: 18.0,
                              letterSpacing: 1.5
                          ),
                        )
                      ],
                    ),
                  )
                         :const SingleChildScrollView()
                )
              ],
            ),
          )
        ],
      ),
      // ------------------------- *************** -------------------------//
    );
  }
}
