import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_api/pages/login.dart';
import 'package:flutter_node_api/pages/posts.dart';
import 'package:flutter_node_api/services/auth_service.dart';
import 'package:flutter_node_api/services/http_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthService auth = AuthService();
  HttpService http = HttpService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String get _email => _emailController.text.trim();
  String get _password => _passwordController.text.trim();

  _submit() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } catch (e) {
      print(e);
    }
    auth.getUser.then((user) async {
      if (user != null) {
        await http.createPost(_email, user.uid.toString());
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PostsPage(id: user.uid)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/background_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Image.asset('assets/eb_sports_logo.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50.0, left: 60, bottom: 30),
              child: Text(
                'Register',
                style: TextStyle(
                    fontFamily: 'Segoe_ui',
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 60.0, top: 30.0),
              child: Text(
                'Username',
                style: TextStyle(
                    fontFamily: 'Segoe_ui',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070)),
              ),
            ),
            Center(
              child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Material(
                    child: TextField(
                      controller: _emailController,
                      onChanged: (email) => _updateState(),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Text(
                'Password',
                style: TextStyle(
                    fontFamily: 'Segoe_ui',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070)),
              ),
            ),
            Center(
              child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Material(
                    child: TextField(
                      controller: _passwordController,
                      onChanged: (password) => _updateState(),
                    ),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    fontFamily: 'Segoe_ui',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: GestureDetector(
                onTap: () => {_submit()},
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff34DAA2)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 40.0, right: 40, top: 8, bottom: 8),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: 'Segoe_ui',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  '-OR-',
                  style: TextStyle(
                      fontFamily: 'Segoe_ui',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff707070)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text(
                    'Click Here to Sign In',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Segoe_ui',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff707070)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _updateState() {
    setState(() {});
  }
}
