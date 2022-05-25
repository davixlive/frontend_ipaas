import 'package:flutter/material.dart';

class FormNewApplication extends StatefulWidget {
  FormNewApplication({Key? key}) : super(key: key);

  @override
  State<FormNewApplication> createState() => _FormNewApplicationState();
}

class _FormNewApplicationState extends State<FormNewApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //crossAxisAlignment: CrossAxisAlignment.start,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter application repo',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter github branch',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
