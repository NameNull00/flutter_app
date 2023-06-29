import 'package:app/ui/model/partido.dart';
import 'package:app/ui/model/torneo.dart';
import 'package:app/ui/styles/Colors.dart';
import 'package:app/ui/widgets/MatchWidget.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/Enums.dart';
import 'package:app/ui/widgets/SportWidget.dart';
import 'model/equipo.dart';

//Completar Torneo y añadir el tipo de deporte en el torneo


class Guest_TournamentScreen extends StatefulWidget {
  Guest_TournamentScreen({Key? key}) : super(key: key);

  @override
  _Guest_TournamentScreenState createState() => _Guest_TournamentScreenState();
}

class _Guest_TournamentScreenState extends State<Guest_TournamentScreen> {
  late List<List<Partido>> jornadas;
  int jornadaSeleccionada = 1;

  @override
  Widget build(BuildContext context) {
    final tournament = ModalRoute.of(context)!.settings.arguments as Torneo;
    jornadas = tournament.getPartidos;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TORNEOS P4"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            color: SelfColors.PALETTE_SEC,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      tournament.getName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DropdownButton(
                  items: List.generate(
                    jornadas.length,
                    (index) => DropdownMenuItem(
                      child: Text(
                        'Jornada ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: index,
                    ),
                  ),
                  value: jornadaSeleccionada - 1,
                  onChanged: (value) {
                    setState(() {
                      jornadaSeleccionada = value! + 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 10, right: 10),
          itemCount: jornadas[jornadaSeleccionada - 1].length,
          itemBuilder: (BuildContext context, int index) {
            Partido partido = jornadas[jornadaSeleccionada - 1][index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: MatchWidget(
                deporte: tournament.getSport,
                match: partido,
              ),
            );
          },
        ),
      ),
    );
  }
}
