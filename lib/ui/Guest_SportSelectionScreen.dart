// General imports
import 'package:app/ui/widgets/CompetitionWidget.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/Enums.dart';
import 'package:app/ui/widgets/SportWidget.dart';
import 'package:app/ui/model/torneo.dart';
import 'package:app/ui/widgets/CompetitionWidget.dart';

class Guest_SportSelectionScreen extends StatelessWidget{
  Guest_SportSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TORNEOS P4")),
        body: Center( child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Text(
              "Selecciona el deporte",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16,),  //Agrega un espacio entre elementos
            SportWidget(deporte: Sports.FUTBOL),
            SizedBox(height: 16,),  //Agrega un espacio entre elementos
            SportWidget(deporte: Sports.BALONCESTO),
            SizedBox(height: 16,),  //Agrega un espacio entre elementos
            SportWidget(deporte: Sports.VOLLEY),
          ]
        )
    ));
  }

}
