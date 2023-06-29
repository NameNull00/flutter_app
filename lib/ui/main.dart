import 'package:app/ui/TournamentCreator.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/MainScreen.dart';
import 'package:app/ui/TestScreen.dart';
import 'package:app/ui/styles/Colors.dart';
import 'package:app/utils/Enums.dart';

import 'Guest_SportSelectionScreen.dart';
import 'Guest_CompetitionViewScreen.dart';
import 'User_LoginScreen.dart';
import 'Guest_TournamentScreen.dart';
import 'MatchInfoScreen.dart';

import 'package:app/utils/Data.dart';
import 'package:app/ui/model/torneo.dart';
import 'package:app/ui/model/equipo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Torneo> torneos = Torneos;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DS_GP8_P4 - Sistema Torneos',
        theme: mytheme,

        // PAGINA INICIAL
        initialRoute: '/',

        // DECLARACION DE TODAS LAS PANTALLAS Y RUTAS
        routes: {

          '/': (context) => MainScreen(),
          '/guest_sport': (context) => Guest_SportSelectionScreen(),
          '/guest_football_comp' : (context) => Guest_CompetitionViewScreen(selection: Sports.FUTBOL, torneos: torneos,),
          '/guest_basketball_comp' : (context) => Guest_CompetitionViewScreen(selection: Sports.BALONCESTO, torneos: torneos,),
          '/guest_volleyball_comp' : (context) => Guest_CompetitionViewScreen(selection: Sports.VOLLEY, torneos: torneos,),
          '/view_tournament' : (context) => Guest_TournamentScreen(),
          '/view_team' :(context) => MatchInfoScreen(),
          '/login': (context) => User_LoginScreen(),
          '/'
          '/test': (context) => TestScreen(),

          '/loged_tournament': (context) => TournamentCreator(torneos: torneos)
        },
      );
  }

  static ThemeData mytheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: SelfColors.PALETTE_PRI),
    canvasColor: SelfColors.PALETTE_TER,
  );
  
}

