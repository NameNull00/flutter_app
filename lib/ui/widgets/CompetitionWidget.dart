import 'package:app/ui/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/ui/styles/ButtonStyles.dart';
import 'package:app/utils/Enums.dart';
import 'package:app/ui/model/torneo.dart';

class CompetitionWidget extends StatelessWidget {
  late Torneo competition;
  late String logo_src;
  late String sport_src;
  String route_tournament = '/view_tournament';

  CompetitionWidget({super.key, required this.competition}) {
    switch (competition.getTiposTorneo) {
      case TiposTorneo.LIGA:
        logo_src = 'assets/sport-icons/tournaments-liga.svg';
        break;
      case TiposTorneo.ELIMINATORIA:
        logo_src = 'assets/sport-icons/tournaments-elim.svg';
        break;
      default:
        logo_src = 'assets/sport-icons/tournaments-elim.svg';
    }
    switch (competition.getSport) {
      case Sports.FUTBOL:
        sport_src = 'assets/sport-icons/balls-football.svg';
        break;
      case Sports.BALONCESTO:
        sport_src = 'assets/sport-icons/balls-basket.svg';
        break;
      case Sports.VOLLEY:
        sport_src = 'assets/sport-icons/balls-volley.svg';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    // Creamos el icono para el tipo de competicion a medida
    Stack stateIcon = Stack(children: [
      Icon(
        Icons.circle,
        color: competition.activo ? Colors.green : Colors.grey,
        size: 20,
      ),
      const Icon(Icons.circle_outlined, color: Colors.black, size: 20)
    ]);

    return Container(
        width: 300,
        height: 75.0,
        child: ElevatedButton(
          onPressed: () => irTorneo(context, competition),
          style: TorneosBtnStyles.ROUND_VERDE,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 55,
              height: 55,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SvgPicture.asset(
                      sport_src,
                      height: 55,
                      width: 55,
                      color: Colors.white60,
                    ),
                  ),
                  Positioned(
                      // Background para el icono
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration:
                            const BoxDecoration(color: SelfColors.GREY_BG),
                      )),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: SvgPicture.asset(
                      logo_src,
                      height: 24,
                      width: 24,
                      color: Colors.black,
                    ),
                  ),
                  // ESTADO DEL TORNEO (Activo / Finalizado)
                  Positioned(right: 0, bottom: 0, child: stateIcon),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    competition.getName,
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    competition.getAdmin,
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    '#${competition.getId.toString()}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12  , fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox( width: 15.0 ),
            SvgPicture.asset(
              'assets/other-icons/right-arrow.svg',
              semanticsLabel: 'arrow',
              height: 16,
              color: Colors.white60,
            ),
          ]),
        ));
  }

  void irTorneo(BuildContext context, Torneo competition) {
    Navigator.pushNamed(context, route_tournament, arguments: competition);
  }
}
