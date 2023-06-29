import 'package:app/ui/model/equipo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/ui/styles/ButtonStyles.dart';
import 'package:app/utils/Enums.dart';

import '../model/partido.dart';


class MatchWidget extends StatelessWidget{

  late Sports deporte;
  late String logo_src;
  late Partido match;


  //Constructor
  MatchWidget({super.key,  required this.deporte, required this.match}) {
    switch(deporte) {
      case Sports.FUTBOL:
        logo_src = 'assets/sport-icons/balls-football.svg';
        break;
      case Sports.BALONCESTO:
        logo_src = 'assets/sport-icons/balls-basket.svg';
        break;
      case Sports.VOLLEY:
        logo_src = 'assets/sport-icons/balls-volley.svg';
        break;
    }
  }

@override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 160.0,
      child: ElevatedButton(
        onPressed: () => {mostrarEquipos(context)},
        style: TorneosBtnStyles.ROUND_VERDE,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        logo_src,
                        semanticsLabel: 'Fútbol Icon',
                        width: 50,
                        height: 50,
                        color: Colors.white60,
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              match.local.nombreEquipo,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Goles: ${match.getGolesL}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        logo_src,
                        semanticsLabel: 'Fútbol Icon',
                        width: 50,
                        height: 50,
                        color: Colors.white60,
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              match.visitante.nombreEquipo,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Goles: ${match.getGolesV}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 0.7,
              height: 80,
              color: Colors.white,
            ),
            SizedBox(width: 10.0),
            Container(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                mostrarEstado(match.estado),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarEquipos(BuildContext context){
    Navigator.pushNamed(context, '/view_team', arguments: match);
  }

  String mostrarEstado(EstadosPartido estado){
    if(estado==EstadosPartido.ENCURSO)
      return "En curso";
    if(estado==EstadosPartido.POREMPEZAR)
      return "Por iniciar";
    if(estado==EstadosPartido.TERMINADO)
      return "Finalizado";
    return "";
  }


}