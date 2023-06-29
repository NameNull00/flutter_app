import 'package:app/ui/styles/Colors.dart';
import 'package:flutter/material.dart';

import '../utils/Enums.dart';
import 'model/partido.dart';

class MatchInfoScreen extends StatelessWidget {
  const MatchInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final match = ModalRoute.of(context)!.settings.arguments as Partido;
    String estado = match.estado == EstadosPartido.POREMPEZAR ? 'Por iniciar' : 'Finalizado';
    String resultado = match.estado == EstadosPartido.TERMINADO ? '${match.getGolesL} - ${match.getGolesV}' : 'VS';

    return Scaffold(
      appBar: AppBar(
        title: Text('Partido'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: SelfColors.PALETTE_SEC,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        match.local.nombreEquipo,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    resultado,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: SelfColors.PALETTE_SEC,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        match.visitante.nombreEquipo,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Estado: $estado',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ExpansionTile(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      match.local.nombreEquipo,
                    ),
                  ),
                ),
                children: [
                  ListTile(
                    title: ExpansionTile(
                      title: Text('Jugadores'),
                      children: [
                        for (var jugador in match.local.jugadores)
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(jugador),
                          )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Entrenador: ${match.local.entrenador}'),
                        Text('Administrador: ${match.local.administrador}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ExpansionTile(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      match.visitante.nombreEquipo,
                    ),
                  ),
                ),
                children: [
                  ListTile(
                    title: ExpansionTile(
                      title: Text('Jugadores'),
                      children: [
                        for(var jugador in match.visitante.jugadores)
                        ListTile(
                          leading:  const Icon(Icons.person_2),
                          title: Text(jugador),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Entrenador: ${match.visitante.entrenador}'),
                        Text('Administrador: ${match.visitante.administrador}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

