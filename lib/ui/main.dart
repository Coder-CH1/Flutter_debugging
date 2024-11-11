import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/local-transfer': (context) => const LocalTransfers(title: 'Local Transfers'),
        '/airtime-data': (context) => const AirtimeData(title: 'Airtime & Data'),
        '/open-account': (context) => const OpenAccount(title: 'Open Account'),
        '/bill-payment': (context) => const BillPayment(title: 'Bill payment'),
        '/bvn': (context) => const BVN(title: 'BVN'),
        '/request-atm': (context) => const RequestATM(title: 'Request for ATM')
      },
    );
  }
}


