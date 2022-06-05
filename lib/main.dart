import 'package:flutter/material.dart';
import 'package:frontend_ipaas/login.dart';
import 'login.dart';
import 'homepage.dart';
import 'newapplication.dart';

void main() {
  runApp(MyApp());
}

// Declaration of the object MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ipaas',
      home: FormNewApplication(),
      debugShowCheckedModeBanner:
          false, // use it for delete the banner "debug" when application is running
    );
  }
}

//Declaration of the object MyHomePage as StatefulWidget
