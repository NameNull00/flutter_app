// ENUM FOR MANAGE STATES, AND SOME UTILS
import 'package:flutter/material.dart';
import 'package:app/ui/styles/Colors.dart';

/// ENUMS PARA LOS DIFERENTES DEPORTES
enum Sports{
  FUTBOL,
  BALONCESTO,
  VOLLEY
}

enum MatchStatus {
  WAITING,
  PLAYING,
  FINISHED
}

enum TeamWidgetStatus {
  UNDEFINED,
  WINNER,
  LOSSER
}

enum TiposTorneo {
  LIGA,
  ELIMINATORIA,
  TODOS
}

enum EstadosPartido{
  POREMPEZAR,
  ENCURSO,
  TERMINADO
}
