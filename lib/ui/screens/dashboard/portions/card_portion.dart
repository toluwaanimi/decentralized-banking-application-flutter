import 'package:bank_app/ui/widgets/transaction_card.dart';
import 'package:bank_app/ui/widgets/wallet_card.dart';
import 'package:bank_app/utils/styles/color_utls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPortion extends StatefulWidget {
  const CardPortion({Key key}) : super(key: key);

  @override
  _CardPortionState createState() => _CardPortionState();
}

class _CardPortionState extends State<CardPortion>
    with AutomaticKeepAliveClientMixin {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    _buildIndicators();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _indicators = [];
  int _currentIndex = 1;

  List<Widget> _buildIndicators() {
    for (int i = 0; i < 3; i++) {
      _indicators.add(
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == i ? Colors.grey[600] : Colors.grey[300],
          ),
        ),
      );
    }
    return _indicators;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: WalletCard(
              color: purple,
            ),
          ),
          // SizedBox(
          //   height: 165,
          //   child: PageView(
          //     controller: _pageController,
          //     onPageChanged: (val) {
          //       setState(() {
          //         _currentIndex = val;
          //       });
          //     },
          //     children: [
          //       WalletCard(
          //         color: Color(0xFF38CFFF),
          //       ),
          //
          //       WalletCard(
          //         color: Color(0xFFFF7438),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 40,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              ...List.generate(
                10,
                (index) => TransactionCard(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
