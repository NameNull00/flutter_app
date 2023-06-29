import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isLoggedIn;
  final String username;
  final VoidCallback onPressed;

  LoginButton({required this.isLoggedIn, this.username = '', required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if (isLoggedIn) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Logged In'),
                content: Text('Username: $username'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
          Navigator.pushNamed(context, '/login');
        }
      },
      icon: Icon(isLoggedIn ? Icons.person : Icons.login),
      label: Text(isLoggedIn ? username : 'Login'),
    );
  }
}

