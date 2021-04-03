import 'package:flutter/material.dart';
import 'package:khnom/utility/my_style.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: SingleChildScrollView (
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyStyle().showLogo(),
              // MyStyle().showTitle('KHNOM'),
              MyStyle().highLightTitle('KHNOM'),
              MyStyle().mySizeBox(),
              userForm(),
              MyStyle().mySizeBox(),
              passWordForm(),
              MyStyle().mySizeBox(),
              loginButton() 
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Container(child: ElevatedButton(onPressed: (){},child: Text('LOGIN')));

  Widget userForm() => Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'User Name',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primryColor))),
      ));

  Widget passWordForm() => Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primryColor))),
      ));
}
