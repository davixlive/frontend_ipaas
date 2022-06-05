//import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

var request = http.Request('GET', Uri.parse('http://127.0.0.1:8080/api/oauth'));

Future fetchRedirectMessageLogin() async {
  http.StreamedResponse response = await request.send();
  String string = await response.stream.bytesToString();
  if (response.statusCode == 200) {
    RedirectMessage redirectMessage =
        RedirectMessage.fromJson(jsonDecode(string));
    html.window.open(redirectMessage.message, 'this_tab');
  } else {
    print(response.reasonPhrase);
  }
}

class RedirectMessage {
  final int returncode;
  final String message;
  final bool error;

  const RedirectMessage(
      {required this.returncode, required this.message, required this.error});
  factory RedirectMessage.fromJson(Map<String, dynamic> json) {
    final returncode = json['code'] as int;
    final message = json['msg'] as String;
    final error = json['error'] as bool;
    return RedirectMessage(
        returncode: returncode, message: message, error: error);
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: OutlinedButton(
          child: const Text(
            "Accedi tramite paleoID",
            style: TextStyle(fontSize: 35),
          ),
          onPressed: () => {fetchRedirectMessageLogin()},
        ),
      )),
    );
  }
}
