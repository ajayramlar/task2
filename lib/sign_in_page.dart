import 'dart:io';

import 'package:firebase_authentication_tutorial/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                exit(exitCode);
              },
            ),
            title: Text(
              "Login page",
              style: TextStyle(color: Colors.greenAccent),
            ),
          ),
          body: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.orange,
                  Colors.greenAccent,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                tileMode: TileMode.mirror,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 75.0,
                  ),
                  Image.asset('images/1.png'),
                  SizedBox(
                    height: 75.0,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  SizedBox(
                    height: 75.0,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 75.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    },
                    child: Text("Sign in"),
                  ),
                  SizedBox(
                    height: 75.0,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
