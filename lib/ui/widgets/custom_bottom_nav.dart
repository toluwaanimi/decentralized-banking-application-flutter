import 'package:bank_app/utils/styles/color_utls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


class CustomBottomNav extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const CustomBottomNav({Key key, @required this.onChanged}) : super(key: key);

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      "Home",
      "Cards",
      "Transactions",
      "Spotlight Merchants",
      "Profile",
    ];
    List<String> svgPaths = [
      "Home",
      "Wallet",
      "Chart",
      "Profile Icon",
    ];

    return Container(
      height: MediaQuery.of(context).padding.bottom + 50,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            color: Colors.grey[100],
            height: 1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    svgPaths.length,
                    (index) {
                      return BottomNavItem(
                        svgPath: "assets/images/${svgPaths[index]}.svg",
                        isFirst: index == 0,
                        isSelected: currentIndex == index,
                        text: texts[index],
                        onTap: () {
                          if (index == 0) {
                            HapticFeedback.heavyImpact();
                          }
                          widget.onChanged(index);
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        color: currentIndex == index ? purple : null,
                      );
                    },
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatefulWidget {
  final VoidCallback onTap;
  final String svgPath;
  final Color color;
  final bool isFirst;
  final String text;
  final bool isSelected;

  const BottomNavItem(
      {Key key,
      this.onTap,
      this.svgPath,
      this.color,
      this.isFirst = false,
      this.isSelected = false,
      this.text})
      : super(key: key);

  @override
  _BottomNavItemState createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  @override
  void initState() {
    super.initState();
  }

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: 70,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                return SvgPicture.asset(
                  widget.svgPath,
                  width: 30,
                  color: widget.isSelected ? purple : Colors.grey,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
