import 'package:flutter/material.dart';
import 'TaskListScreen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered Text widget with a font size of 36
            Center(
              child: Text(
                'Quick Task App',
                style: TextStyle(
                  fontSize: 36, // Text size 36
                  fontWeight: FontWeight.bold, // Optional: Make the text bold
                ),
              ),
            ),
            SizedBox(height: 40), // Adding some space between the title and fields

            TextField(
              controller: _userIdController,
              decoration: InputDecoration(labelText: 'User ID'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple, // White text color
              ),
              onPressed: _signIn,
              child: Text('Sign In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() {
    final String userId = _userIdController.text;
    final String password = _passwordController.text;

    if (userId.isNotEmpty && password.isNotEmpty) {
      // Navigate to Home screen on successful validation
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskListScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill out all fields')));
    }
  }
}
