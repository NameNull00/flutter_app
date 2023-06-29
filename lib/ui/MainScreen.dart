// General imports
import 'package:app/ui/styles/ButtonStyles.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/Enums.dart';
import 'package:app/ui/styles/Colors.dart';
import 'package:app/ui/styles/TextStyles.dart';


class MainScreen extends StatelessWidget{

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SISTEMA TORNEOS")),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                // Funcion para pasar al modo deporte normal
                onTap:()=> entrarComoInvitado(context),
                child: const Center(
                    child: Text(
                      "Continuar como invitado",
                      style: TorneosTextStyles.TITULO_VERDE
                      ),
                    )
                )
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => irLogin(context),
                style: TorneosBtnStyles.ROUND_VERDE,
                child: Text("Log in")
              )
            )
          ]
        )
      )
    );
  }

  /// Funcion para ir a la pantalla de seleccion de deporte como invitado
  void entrarComoInvitado(BuildContext context){
    Navigator.pushNamed(context, '/guest_sport');
  }

  /// Callback para ir a la pantalla de login
  void irLogin(BuildContext context){
    Navigator.pushNamed(context, '/login');
  }

}
