// General imports
import 'package:flutter/material.dart';
import 'package:app/utils/Enums.dart';
import 'package:app/ui/widgets/SportWidget.dart';


class TestScreen extends StatelessWidget{

  TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PANTALLA TESTEO WIDGETS")),
      body: Center(
          child: SportWidget(deporte: Sports.BALONCESTO,)
        )
    );
  }

}
