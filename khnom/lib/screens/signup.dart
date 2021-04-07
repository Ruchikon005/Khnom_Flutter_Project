// import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khnom/utility/my_style.dart';
import 'package:http/http.dart' as http;
import 'DashBoard.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future register() async {
    var url = Uri.parse("http://172.26.255.39/add/register.php");
    final http.Response response = await http.post(
    url, body: {
      "Username": _username.text,
      "Email": _email.text,
      "Password": _password.text,
    });
    var data = json.decode(response.body);
    
    if (data == "Error") {

     Fluttertoast.showToast(
        msg: 'User allready exit!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    } else {

      Fluttertoast.showToast(
        msg: "Register Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard(),),);
    }
  }


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
            registerButton(),
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
              controller: _username,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
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
              controller: _email,
              validator: (value) {
                if (value.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Enter a valid email!';
                }
                return null;
              },
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
                controller: _password,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
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
              controller: passwordAgain,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password again';
                } else if (value != _password.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
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
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  print('name : ${_username.text}');
                  // signup(name, email, password);
                  // registerThreand();
                  // doLogin();
                  register();
                },
                child: Text('Verify'),
              ),
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
//thread
  // Future registerThreand() async {
  //   String url =
  //       'http://localhost:3001/api/register';

  //   try {
  //     return await Dio().post(url);
  //     options:
  //     Options(
  //       contentType: Headers.formUrlEncodedContentType,
  //     );
  //     // print('res = $response');
  //   } catch (e) {}
  // }
}

// signup(name, email, password) async {
//   var url = Uri.http("192.168.31.76", "/api/register");
//   http.Response response = await http.post(
//     url,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'Username': name,
//       'Email': email,
//       'Password': password,
//     }),
//   );

//   if (response.statusCode == 201) {
//   } else {
//     throw Exception('Failed to create album.');
//   }
// }
