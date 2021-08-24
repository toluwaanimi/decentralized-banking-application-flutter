import 'package:bank_app/utils/styles/color_utls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Color color;
  final Color textColor;
  final Widget leading;
  final String text;
  final VoidCallback onTap;
  final bool enableShadow;

  const CustomButton(
      {Key key,
      this.color,
      this.leading,
      @required this.text,
      this.textColor,
      this.enableShadow = false,
      @required this.onTap})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        shadowColor: widget.color,
        elevation: widget.enableShadow ? 8 : 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 23),
          decoration: BoxDecoration(
            color: widget.color ?? purple,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.leading ?? SizedBox(),
              Text(
                widget.text,
                style: TextStyle(
                    color: widget.textColor ?? Colors.white,
                    fontSize: 16,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
