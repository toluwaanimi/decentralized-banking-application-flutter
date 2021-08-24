import 'package:bank_app/ui/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';

import 'portions/card_portion.dart';
import 'portions/home_portion.dart';
import 'portions/profile_portion.dart';
import 'portions/transaction_portion.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(
        onChanged: (v) {
          setState(() {
            currentPage = v;
            controller.jumpToPage(v);
          });
        },
      ),
      body: SafeArea(
        top: false,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomePortion(),
            CardPortion(),
            TransactionPortion(),
            ProfilePortion(),
          ],
        ),
      ),
    );
  }

  PageController controller = PageController();
}
