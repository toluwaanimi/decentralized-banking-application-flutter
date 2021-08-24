import 'package:bank_app/ui/widgets/custom_button.dart';
import 'package:bank_app/ui/widgets/custom_text_field.dart';
import 'package:bank_app/utils/styles/color_utls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              CustomTextField(
                hint: "Email, ID, phone number or username",
                prefix: Container(
                  margin: EdgeInsets.only(right: 3),
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(height: 5),
              CustomTextField(
                hint: "Password",
                prefix: Container(
                  margin: EdgeInsets.only(right: 3),
                  child: Icon(
                    Icons.lock_outline_rounded,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Forgot Password?', style: TextStyle(
                  color: purple,
                  fontWeight: FontWeight.bold
              ),),
              Spacer(),
              CustomButton(text: 'Login', onTap: (){

              }),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Don't have an account?"),
                  Text("Register")
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
