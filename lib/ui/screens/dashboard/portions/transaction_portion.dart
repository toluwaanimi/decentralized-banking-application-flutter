import 'package:bank_app/ui/widgets/transaction_card.dart';
import 'package:bank_app/utils/styles/color_utls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionPortion extends StatefulWidget {
  const TransactionPortion({
    Key key,
  }) : super(key: key);

  @override
  _TransactionPortionState createState() => _TransactionPortionState();
}

class _TransactionPortionState extends State<TransactionPortion>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          color: purple.withOpacity(.2),
          padding: EdgeInsets.only(top: 60.0, left: 15.0, right: 15.0),
          height: 340,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 6,
                    color: purple.withOpacity(.6),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$ 4,215',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: purple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        _TransactionEntry(
          date: '10 MARCH 2020',
        ),
        _TransactionEntry(
          date: '11 MARCH 2020',
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _TransactionEntry extends StatelessWidget {
  const _TransactionEntry({
    Key key,
    this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            date,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ...List.generate(
          3,
          (index) => TransactionCard(),
        ),
        Divider(
          height: 30,
        ),
      ],
    );
  }
}
