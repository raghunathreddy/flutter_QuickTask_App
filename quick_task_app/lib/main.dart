import 'package:flutter/material.dart';
import 'screens/signin_screen.dart';

void main() async {
  // Initialize Parse SDK with your Back4App credentials
/*  await Parse().initialize(
    'YOUR_PARSE_APPLICATION_ID',  // Replace with your Back4App Application ID
    'https://parseapi.back4app.com',  // Replace with your Back4App server URL
    clientKey: 'YOUR_PARSE_CLIENT_KEY',  // Optional, if you have a client key
    autoSendSessionId: true,
  );*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(), // Initially navigate to the SignInScreen
    );
  }
}
