import 'package:bank_app/utils/styles/color_utls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePortion extends StatefulWidget {
  const ProfilePortion({Key key}) : super(key: key);

  @override
  _ProfilePortionState createState() => _ProfilePortionState();
}

class _ProfilePortionState extends State<ProfilePortion>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        children: [
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: purple.withOpacity(.3),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Genry Rose',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '@genryrose',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: 3,
                          width: 3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        '20 firends',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ 600,000',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                customBorder: StadiumBorder(),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Transfer balance',
                    style: TextStyle(
                      fontSize: 16,
                      color: purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          _ListTileEntry(
            iconData: Icons.search_rounded,
            label: 'Search people',
            onTap: () {},
          ),
          _ListTileEntry(
            iconData: Icons.search_rounded,
            label: 'Pending transactions',
            onTap: () {},
          ),
          _ListTileEntry(
            iconData: Icons.search_rounded,
            label: 'Transactions history',
            onTap: () {},
          ),
          _ListTileEntry(
            iconData: Icons.search_rounded,
            label: 'Settings',
            onTap: () {},
          ),
          _ListTileEntry(
            iconData: Icons.search_rounded,
            label: 'Legal',
            onTap: () {},
          ),
          _ListTileEntry(
            iconData: Icons.help_rounded,
            label: 'Help',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListTileEntry extends StatelessWidget {
  const _ListTileEntry({
    Key key,
    this.iconData,
    this.label,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: purple,
          ),
          child: Center(
            child: Icon(
              iconData,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
        title: Transform.translate(
          offset: Offset(-15, 0),
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
