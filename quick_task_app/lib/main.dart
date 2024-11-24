import 'package:flutter/material.dart';
//import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'screens/signin_screen.dart';

void main() async {
  Initialize Parse SDK with your Back4App credentials
  await Parse().initialize(
    'lUtuxUMAbbVwmw6AJ3JkVImChm2it3LlgtN5GwSz',  // Replace with your Back4App Application ID
    'https://parseapi.back4app.com',  // Replace with your Back4App server URL
    clientKey: 'L5bxQ2Rbww5or0fEELla1sOzn8WL12e2VoCqqZsl',  // Optional, if you have a client key
    autoSendSessionId: true,
  );

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
