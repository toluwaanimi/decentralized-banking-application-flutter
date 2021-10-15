import 'package:bank_app/ui/screens/dashboard/dashboard_screen.part.dart';
import 'package:flutter/material.dart';

import 'ui/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BankYou',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingScreen(),
    );
  }
}
