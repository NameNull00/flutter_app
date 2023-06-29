import 'package:app/ui/model/torneo.dart';
import 'package:app/ui/model/equipo.dart';
import 'package:app/ui/model/partido.dart';
import 'Enums.dart';

String n = "ALFA";
List<String> j = ["B", "C"];
String e = "D";
String a = "E";

String n2 = "BETA";

Equipo equipo1 = new Equipo(n, j, e, a);
Equipo equipo2 = new Equipo(n2, j, e, a);
Equipo equipo3 = new Equipo(n, j, e, a);
Equipo equipo4 = new Equipo(n2, j, e, a);
Equipo equipo5 = new Equipo(n, j, e, a);
Equipo equipo6 = new Equipo(n2, j, e, a);
Equipo equipo7 = new Equipo(n, j, e, a);
Equipo equipo8 = new Equipo(n2, j, e, a);

List<Equipo> participantes_futbol = [equipo1, equipo2, equipo3, equipo4, equipo5, equipo6, equipo7, equipo8];
List<Equipo> participantes_baloncesto = [equipo1, equipo2, equipo3, equipo4, equipo5, equipo6, equipo7, equipo8];
List<Equipo> participantes_volley = [equipo1, equipo2, equipo3, equipo4, equipo5, equipo6, equipo7, equipo8];

Torneo torneo1 = Torneo(TiposTorneo.LIGA, 1, 'User1', 'SUPERLIGA', false,
    Sports.FUTBOL, participantes_futbol);
Torneo torneo2 = Torneo(TiposTorneo.LIGA, 2, 'User1', 'EPICBASKET', true,
    Sports.BALONCESTO, participantes_baloncesto);
Torneo torneo3 = Torneo(TiposTorneo.ELIMINATORIA, 3, 'User2', 'CHAMPIONS', true,
    Sports.FUTBOL, participantes_futbol);
Torneo torneo4 = Torneo(TiposTorneo.ELIMINATORIA, 4, 'User232', 'KINGSCUP',
    false, Sports.BALONCESTO, participantes_baloncesto);
Torneo torneo5 = Torneo(TiposTorneo.LIGA, 5, 'UserA', 'VOLLEYRIVALS', false,
    Sports.VOLLEY, participantes_volley);
Torneo torneo6 = Torneo(TiposTorneo.LIGA, 6, 'UserA', 'VOLLEYMASTERS', true,
    Sports.VOLLEY, participantes_volley);
Torneo torneo7 = Torneo(
    TiposTorneo.LIGA, 7, 'UserA', 'VBF', true, Sports.VOLLEY, participantes_volley);

List<Torneo> Torneos = <Torneo>[
  torneo1,
  torneo2,
  torneo3,
  torneo4,
  torneo5,
  torneo6,
  torneo7
];



