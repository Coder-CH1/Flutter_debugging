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
        '/local-transfer': (context) => const AirtimeData(title: 'Airtime & Data'),
        '/local-transfer': (context) => const OpenAccount(title: 'Open Account'),
        '/local-transfer': (context) => const BillPayment(title: 'Bill payment'),
        '/local-transfer': (context) => const BVN(title: 'BVN'),
        '/local-transfer': (context) => const RequestATM(title: 'Request for ATM')
      },
    );
  }
}


