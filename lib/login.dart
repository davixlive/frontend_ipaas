import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frontend_ipaas/homepage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: TextButton(
            child:
                Text("Accedi tramite paleoID", style: TextStyle(fontSize: 35)),
            onPressed: () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyHomePage()))
                }),
      )),
    );
  }
}
