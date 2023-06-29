import 'package:flutter/material.dart';
import 'package:app/utils/Enums.dart';
import 'package:app/ui/model/torneo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/ui/styles/Colors.dart';

class FilterRow extends StatefulWidget {
  final Function(Sports) onSportChanged;
  final Function(TiposTorneo) onTypeChanged;
  final Function(bool) onEndedChanged;
  final Function() onErased;
  final bool ended;
  final String chosen_sport;
  final String chosen_comp;

  FilterRow({
    required this.chosen_sport,
    required this.chosen_comp,
    required this.ended,
    required this.onSportChanged,
    required this.onTypeChanged,
    required this.onEndedChanged,
    required this.onErased,
  });

  @override
  _FilterRowState createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  @override
  Widget build(BuildContext context) {
    String _comp_elegida = widget.chosen_comp;
    String _deporte_elegido = widget.chosen_sport;
    bool ended = widget.ended;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            value: _deporte_elegido,
            onChanged: (newValue) {
              setState(() {
                _deporte_elegido = newValue!;
                switch(_deporte_elegido){
                  case 'BALONCESTO':
                    widget.onSportChanged(Sports.BALONCESTO);
                    break;
                  case 'FUTBOL':
                    widget.onSportChanged(Sports.FUTBOL);
                    break;
                  case 'VOLLEY':
                    widget.onSportChanged(Sports.VOLLEY);
                    break;
                }
              });
            },
            items: Sports.values.map<DropdownMenuItem<String>>((Sports s) {
              return DropdownMenuItem<String>(
                value: s.name,
                child: Text(s.name),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: _comp_elegida,
            onChanged: (newValue) {
              setState(() {
                _comp_elegida = newValue!;
                if (_comp_elegida == 'Todos') {
                  widget.onTypeChanged(TiposTorneo.TODOS);
                } else if (_comp_elegida == 'Ligas') {
                  widget.onTypeChanged(TiposTorneo.LIGA);
                } else if (_comp_elegida == 'Eliminatorios') {
                  widget.onTypeChanged(TiposTorneo.ELIMINATORIA);
                }
              });
            },
            items: [
              'Todos',
              'Ligas',
              'Eliminatorios',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Row(children: [
            Text('En curso'),
            Checkbox(
              checkColor: Colors.white,
              value: ended,
              onChanged: (bool? value) {
                setState(() {
                  ended = value!;
                  widget.onEndedChanged(ended);
                });
              },
            ),
          ]),
          Ink(
            decoration: ShapeDecoration(
              color: SelfColors.PALETTE_PRI,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: IconButton(
              onPressed: () {
                widget.onErased();
              },
              icon: SvgPicture.asset(
                'assets/other-icons/cleaner.svg',
                color: Colors.white,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
