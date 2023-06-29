import 'package:app/ui/widgets/CompetitionWidget.dart';
import 'package:app/ui/widgets/FilterWidget.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/Enums.dart';
import 'package:app/ui/model/torneo.dart';
import 'package:app/ui/model/equipo.dart';
import 'package:app/utils/Data.dart';


const List<String> deportes = <String>['Football', 'Basketball', 'Volleyball'];
const List<String> tipos_torneo = <String>['Todos', 'Ligas', 'Eliminatorios'];

class Guest_CompetitionViewScreen extends StatefulWidget {
  final selection;

  const Guest_CompetitionViewScreen({Key? key, required this.selection, required torneos})
      : super(key: key);

  @override
  State<Guest_CompetitionViewScreen> createState() =>
      _Guest_CompetitionViewScreenState();
}

class _Guest_CompetitionViewScreenState extends State<Guest_CompetitionViewScreen> {
  final torneos = Torneos;

  var CurrentSearch = <Torneo>[];

  late Sports sport;

  var name = '';

  late String _deporte_string;
  String _comp_elegida = 'Todos';

  bool ended = false;

  var type = TiposTorneo.TODOS;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    sport = widget.selection;
    print('Selected: ${sport.name}');
    changeSelectedSport(sport);
  }

  void changeSelectedSport(sport){
    // _deporte_string = sport.name;
    switch (sport) {
      case Sports.FUTBOL:
        _deporte_string = Sports.FUTBOL.name;
        break;
      case Sports.BALONCESTO:
        _deporte_string = Sports.BALONCESTO.name;
        break;
      case Sports.VOLLEY:
        _deporte_string = Sports.VOLLEY.name;
        break;
    }
  }

  /// TODO refactorizar el enum a solo LIGA / TORNEOS y que esto sea nulable,
  /// si no hay eleccion, type sera null, y se mostraran todos
  void changeSelectedType(){
    switch (type) {
      case TiposTorneo.TODOS:
        _comp_elegida = 'Todos';
        break;
      case TiposTorneo.LIGA:
        _comp_elegida = 'Ligas';
        break;
      case TiposTorneo.ELIMINATORIA:
        _comp_elegida = 'Eliminatorios';
        break;
    }
  }

  void erased() {
    setState(() {
      ended = false;
      name = '';
      _comp_elegida = 'Todos';
      type = TiposTorneo.TODOS;
      _controller.clear();
      CurrentSearch.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    CurrentSearch.clear();
    CurrentSearch = torneos.where((t) =>
    t.getSport == sport &&
        (type == TiposTorneo.TODOS || t.getTiposTorneo == type) &&
        (name == '' || t.getName.contains(name)) &&
        (!ended || t.activo)
    ).toList();
    return Scaffold(
      appBar: AppBar(title: const Text("BUSQUEDA TORNEOS")),
      body: Column(
        children: [
          FilterRow(
            chosen_sport: _deporte_string,
            chosen_comp: _comp_elegida,
            ended: ended,
            onSportChanged: (sport) {
              setState(() {
                this.sport = sport;
                changeSelectedSport(sport);
              });
            },
            onTypeChanged: (type) {
              setState(() {
                this.type = type;
                changeSelectedType();
              });
            },
            onEndedChanged: (ended) {
              setState(() {
                this.ended = ended;
                CurrentSearch.clear();
              });
            },
            onErased: () => erased,
          ),
          SizedBox(
            width: 350,
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintText: 'Enter a search term',
              ),
              maxLines: 3,
              minLines: 1,
              controller: _controller,
              onChanged: (text) {
                setState(() {
                  name = text;
                });
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var comp in CurrentSearch)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CompetitionWidget(competition: comp),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
