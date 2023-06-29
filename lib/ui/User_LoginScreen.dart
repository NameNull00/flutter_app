// General imports
import 'package:app/ui/styles/ButtonStyles.dart';
import 'package:flutter/material.dart';
// import 'package:app/utils/Data.dart';

class User_LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _User_LoginScreenState();
  }
}

class _User_LoginScreenState extends State<User_LoginScreen> {
  String _username = '';
  String _password = '';

  void _login() {
    // Verificar el usuario y la contraseña aquí
    if (_username == 'admin' && _password == '1234') {
      // Navegar a la siguiente pantalla si son correctos
      Navigator.pushNamed(context, '/loged_tournament');
    } else {
      // Mostrar un mensaje de error si son incorrectos
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Usuario o contraseña incorrectos'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TORNEOS P4")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Usuario',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // if()
                  _login();
                },
                style: TorneosBtnStyles.ROUND_VERDE,
                child: Text('Iniciar sesión'),
              ),
            ],
          ),
        ));
  }
}
