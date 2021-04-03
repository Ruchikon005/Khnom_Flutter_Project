import 'package:flutter/material.dart';
import 'package:khnom/utility/my_style.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name, email, password, againpassword;
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            myLogo(),
            MyStyle().mySizeBox(),
            textRegister(),
            MyStyle().mySizeBox(),
            usernameForm(),
            MyStyle().mySizeBox(),
            emailForm(),
            MyStyle().mySizeBox(),
            passwordForm(),
            MyStyle().mySizeBox(),
            passwordAgainForm(),
            MyStyle().mySizeBox(),
            registerButton()
          ],
        ),
      ),
    );
  }

//Register
  Row textRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showTextRegister('Register'),
      ],
    );
  }

//Username Texfield
  Widget usernameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
              onChanged: (value) =>
                  name = value.trim(), // trim เอาช้องว่างหน้าคำหลังคำไปด้วย
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_box,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'User Name',
                hintText: 'User Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().darkColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().primryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().errorBorder),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().errorBorder),
                ),
              ),
            ),
          ),
        ],
      );

//Email Texfield
  Widget emailForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Enter a valid email!';
                }
                return null;
              },
              onChanged: (value) => email = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'Email',
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().darkColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().primryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().errorBorder),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().errorBorder),
                ),
              ),
            ),
          ),
        ],
      );

//Password Texfield
  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                onChanged: (value) => password = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Password',
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: MyStyle().borderRadius,
                    borderSide: BorderSide(color: MyStyle().darkColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: MyStyle().borderRadius,
                    borderSide: BorderSide(color: MyStyle().primryColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: MyStyle().borderRadius,
                    borderSide: BorderSide(color: MyStyle().errorBorder),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: MyStyle().borderRadius,
                    borderSide: BorderSide(color: MyStyle().errorBorder),
                  ),
                ),
                autofocus: false,
                obscureText: true,
              )),
        ],
      );

//PasswordAgain Texfield
  Widget passwordAgainForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password again';
                }
                else if(value != password){
                  return 'Passwords do not match';
                }
                return null;
              },
              onChanged: (value) => againpassword = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'Enter password again',
                hintText: 'password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().darkColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().primryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().errorBorder),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: MyStyle().borderRadius,
                  borderSide: BorderSide(color: MyStyle().errorBorder),
                ),
              ),
              autofocus: false,
              obscureText: true,
            ),
          ),
        ],
      );

  Widget registerButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('''
                  name: $name 
                  Email: $email
                  password: $password
                  Againpassword: $againpassword
                  ''');
                }
              },
              child: Text('Verify'),
            ),
          ),
        ],
      );

  Row showAppname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            MyStyle().highLightTitle('KHNOM'),
          ],
        ),
      ],
    );
  }

//ถ้าใช้ widget อยู่ใน listview จะมีค่าความกว้างเท่ากับขนาดของ listviwe เสมอ
  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().showLogo(),
        ],
      );
}
