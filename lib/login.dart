//import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

var request = http.Request('GET', Uri.parse('localhost:8080/api/oauth'));

Future fetchRedirectMessageLogin() async {
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
  // Use the compute function to run parsePhotos in a separate isolate.
  //return redirectMessage;
}

class RedirectMessage {
  final int returncode;
  final String message;
  final bool error;

  const RedirectMessage(
      {required this.returncode, required this.message, required this.error});
  factory RedirectMessage.fromJson(dynamic json) {
    return RedirectMessage(
      returncode: json['code'] as int,
      message: json['msg'] as String,
      error: json['error'] as bool,
    );
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
          child: Text(
            "Accedi tramite paleoID",
            style: TextStyle(fontSize: 35),
          ),
          onPressed: () => {
            //html.window.open("localhost:8080/api/oauth", "_blank")
          },
        ),
      )),
    );
  }
}
