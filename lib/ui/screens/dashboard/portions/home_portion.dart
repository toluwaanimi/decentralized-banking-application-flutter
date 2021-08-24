import 'dart:developer';

import 'package:bank_app/ui/widgets/transaction_card.dart';
import 'package:bank_app/utils/styles/color_utls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePortion extends StatefulWidget {
  const HomePortion({Key key}) : super(key: key);

  @override
  _HomePortionState createState() => _HomePortionState();
}

class _HomePortionState extends State<HomePortion>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Align(
            child: Text(
              'Your balance',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: '\$ ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '600,000',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: purple,
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Divider(
            height: 0,
          ),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (_, int index) {
              return _ItemActionCard(
                itemActionCardData: _ItemActionCardData.itemsCardsData[index],
                onTap: () {
                  final cardDate = _ItemActionCardData.itemsCardsData[index];
                  log('card tapped is ${cardDate.label}');
                },
              );
            },
            itemCount: 2,
          ),
          Divider(
            height: 0,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.search_rounded,
                  size: 24,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListView.builder(
            // since max length to be displayed won't exceed 15
            shrinkWrap: true,
            primary: false,
            itemBuilder: (_, int index) {
              return TransactionCard();
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ItemActionCard extends StatelessWidget {
  const _ItemActionCard({
    Key key,
    this.itemActionCardData,
    this.onTap,
  }) : super(key: key);

  final _ItemActionCardData itemActionCardData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: itemActionCardData.borderConfig.hasTop
              ? BorderSide(
                  color: Colors.grey[200],
                )
              : BorderSide.none,
          bottom: itemActionCardData.borderConfig.hasBottom
              ? BorderSide(
                  color: Colors.grey[200],
                )
              : BorderSide.none,
          left: itemActionCardData.borderConfig.hasLeft
              ? BorderSide(
                  color: Colors.grey[200],
                )
              : BorderSide.none,
          right: itemActionCardData.borderConfig.hasRight
              ? BorderSide(
                  color: Colors.grey[200],
                )
              : BorderSide.none,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: itemActionCardData.color,
              ),
              child: Center(
                child: Text(
                  itemActionCardData.emoji,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              itemActionCardData.label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemActionCardData {
  _ItemActionCardData({
    this.label,
    this.color,
    this.emoji,
    this.borderConfig,
  });

  final String label;
  final Color color;
  final String emoji;
  final _BorderConfig borderConfig;

  static List<_ItemActionCardData> itemsCardsData = [
    _ItemActionCardData(
      label: 'Top up',
      color: Colors.purple.withOpacity(.5),
      emoji: '💰',
      borderConfig: _BorderConfig(
        hasRight: true,
        hasTop: false,
        hasBottom: false,
        hasLeft: false,
      ),
    ),
    _ItemActionCardData(
      label: 'Send credit',
      color: Colors.green.withOpacity(.5),
      emoji: '💸',
      borderConfig: _BorderConfig(
        hasRight: false,
        hasTop: false,
        hasBottom: false,
        hasLeft: false,
      ),
    ),
    // _ItemActionCardData(
    //   label: 'Pay',
    //   color: Colors.amber.withOpacity(.5),
    //   emoji: '💳',
    //   borderConfig: _BorderConfig(
    //     hasRight: true,
    //     hasTop: true,
    //     hasBottom: false,
    //     hasLeft: false,
    //   ),
    // ),
    // _ItemActionCardData(
    //   label: 'Request Credit',
    //   color: Colors.orange.withOpacity(.5),
    //   emoji: '🤑',
    //   borderConfig: _BorderConfig(
    //     hasTop: true,
    //     hasBottom: false,
    //     hasLeft: false,
    //     hasRight: false,
    //   ),
    // ),
  ];
}

class _BorderConfig {
  _BorderConfig({
    this.hasTop = false,
    this.hasBottom = false,
    this.hasLeft = false,
    this.hasRight = false,
  });

  bool hasTop;
  bool hasBottom;
  bool hasLeft;
  bool hasRight;
}
