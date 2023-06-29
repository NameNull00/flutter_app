// General imports
// import 'package:app/ui/widgets/CompetitionWidget.dart';
import 'package:app/ui/model/torneo.dart';
import 'package:app/ui/styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/Enums.dart';
import 'package:app/ui/styles/ButtonStyles.dart';
import 'package:app/ui/styles/TextStyles.dart';
// import 'package:app/ui/widgets/SportWidget.dart';
// import 'package:app/ui/model/torneo.dart';
import 'package:app/ui/model/equipo.dart';

import 'package:app/utils/Data.dart';

// cambiar a statefull widget

class TournamentCreator extends StatefulWidget {
  List<Equipo> torneos = [];

  TournamentCreator({required torneos});
  // List<Equipo> equipos = [];
  @override
  State<TournamentCreator> createState() {
    return _TournamentCreatorState(torneos: this.torneos);
  }
}

class _TournamentCreatorState extends State<TournamentCreator> {
  TiposTorneo _tipo = TiposTorneo.LIGA;
  Sports _deporte = Sports.FUTBOL;
  int _id = 0;
  List<Equipo> _equipos = participantes_futbol;
  List<Torneo> torneos = [];

  List<Equipo> _seleccionados = [];

  _TournamentCreatorState({required torneos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TORNEOS P4")),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const SizedBox(height: 20),
              const Text("Tipo de torneo:",
                  style: TorneosTextStyles.TITULO_VERDE),
              const SizedBox(height: 10.0),
              Row(children: [
                Expanded(
                    child: ListTile(
                  title: const Text('Liga'),
                  leading: Radio<TiposTorneo>(
                    value: TiposTorneo.LIGA,
                    groupValue: _tipo,
                    onChanged: changeTipo,
                  ),
                )),
                Expanded(
                    child: ListTile(
                  title: const Text('Eliminatoria'),
                  leading: Radio<TiposTorneo>(
                    value: TiposTorneo.ELIMINATORIA,
                    groupValue: _tipo,
                    onChanged: changeTipo,
                  ),
                )),
              ]),
              const SizedBox(height: 10.0),
              const Text("Elige el deporte:",
                  style: TorneosTextStyles.TITULO_VERDE),
              Column(children: [
                ListTile(
                  title: const Text('Futbol'),
                  leading: Radio<Sports>(
                      value: Sports.FUTBOL,
                      groupValue: _deporte,
                      onChanged: changeDeporte),
                ),
                ListTile(
                  title: const Text('Baloncesto'),
                  leading: Radio<Sports>(
                      value: Sports.BALONCESTO,
                      groupValue: _deporte,
                      onChanged: changeDeporte),
                ),
                ListTile(
                  title: const Text('Voleibol'),
                  leading: Radio<Sports>(
                      value: Sports.VOLLEY,
                      groupValue: _deporte,
                      onChanged: changeDeporte),
                ),
              ]),
              const SizedBox(height: 10.0),
              const Text("Equipos:", style: TorneosTextStyles.TITULO_VERDE),
              Expanded(
                child: ListView.builder(
                  itemCount: _equipos.length,
                  itemBuilder: (context, index) {
                    final team = _equipos[index];
                    final isSelected = _seleccionados.contains(team);

                    return ListTile(
                      title: Text(team.nombreEquipo),
                      trailing: Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              _seleccionados.add(team);
                            } else {
                              _seleccionados.remove(team);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  crearTorneo();
                  Navigator.pop(context);
                },
                style: TorneosBtnStyles.ROUND_VERDE,
                child: const Text('Crear Torneo'),
              ),
              const SizedBox(height: 20.0),
            ])));
  }

  @override
  void initState() {
    super.initState();
  }

  /// Funcion para cuando cambia el tipo de torneo en el selector
  void changeTipo(TiposTorneo? newTorneo) {
    setState(() {
      _tipo = newTorneo!;
    });
  }

  /// Función para cuando cambia el deporte en el selector
  void changeDeporte(Sports? value) {
    setState(() {
      _deporte = value!;
      _equipos = participantes_volley;
    });
  }

  void crearTorneo(){
    Torneo nuevo = Torneo(_tipo, _id, "admin", "Torneo ${_id}",
        false, _deporte, _equipos);
    _id++;
    Torneos.add(nuevo);
  }
}
