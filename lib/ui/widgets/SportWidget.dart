import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/ui/styles/ButtonStyles.dart';
import 'package:app/utils/Enums.dart';


class SportWidget extends StatelessWidget{

  late Sports deporte;
  late String logo_src;

  //Constructor
  SportWidget({super.key,  required this.deporte}) {
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
      width: 250.0,
      height: 70.0,
      child: ElevatedButton(
        onPressed:() => irDeporte(context),
        style: TorneosBtnStyles.ROUND_VERDE,
        child: Row(
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
            Expanded( child: Text(
              deporte.name,
              style: const TextStyle( fontSize: 20.0, color: Colors.white, ),
            )),
            SvgPicture.asset(
              'assets/other-icons/right-arrow.svg',
              semanticsLabel: 'arrow',
              height: 16,
              color: Colors.white60,
            ),
          ],
        ),
      ),
    );
  }

  void irDeporte(BuildContext context){
    if(deporte == Sports.FUTBOL) {
      Navigator.pushNamed(context, '/guest_football_comp');
    }
    else if(deporte == Sports.BALONCESTO) {
      Navigator.pushNamed(context, '/guest_basketball_comp');
    }
    else if(deporte == Sports.VOLLEY) {
      Navigator.pushNamed(context, '/guest_volleyball_comp');
    }
  }
}

