import 'package:bank_app/ui/screens/authentication/login_screen.dart';
import 'package:bank_app/ui/screens/authentication/register_screen.dart';
import 'package:bank_app/ui/widgets/custom_button.dart';
import 'package:bank_app/utils/navigation/navigator.dart';
import 'package:bank_app/utils/styles/color_utls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/onboarding.svg",
                height: 400,
              ),
              Text(
                "onzo",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 80),
              ),
              Text(
                "The secure bank,\nyou you want",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7), fontSize: 20),
              ),
              Spacer(),
              CustomButton(
                text: "Register as a new user",
                color: Color(0xffFEFEFE),
                textColor: purple,
                onTap: () {
                  pushTo(context, RegisterScreen());
                },
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: 'Gilroy',
                  ),
                  children: [
                    TextSpan(
                      text: "Log in",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          pushTo(context, LoginScreen());
                        },
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
