import 'package:flutter/material.dart';
import 'package:my_money_replica/selectcountry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Money Replica',
      debugShowCheckedModeBanner: false,
      home: CurrencySelectionScreen(),
    );
  }
}
