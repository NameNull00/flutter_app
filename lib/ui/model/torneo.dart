import 'package:app/ui/model/equipo.dart';
import 'package:app/ui/model/partido.dart';
import 'dart:math';
import '../../utils/Enums.dart';

class Torneo {
  Sports _deporte;
  TiposTorneo _tipo;
  int _id; //en la base de datos se asignara automaticamente
  late bool _isActivo;
  String _nombreTorneo;
  String _administrador;
  late List<Equipo> _participantes;
  late List<List<Partido>> _partidos = [[Partido(Equipo("a", ["a"], "a", "a"), Equipo("a", ["a"], "a", "a"))]]; // jornada[i][j] partido j de la jornada i
  //int _nextJornada = 0;

  Torneo(this._tipo, this._id, this._administrador, this._nombreTorneo,this._isActivo, this._deporte,  this._participantes) {

    if(_tipo == TiposTorneo.LIGA){
      int jornadas = _participantes.length;
      _partidos = List.generate(jornadas, (_) => []);

      for(int i = 0; i < _partidos.length; i++){
        for(int j = 0; j < _partidos.length; j++){
          if(i != j) {
            Partido match = Partido(_participantes[i], _participantes[j]);
            _partidos[i].add(match);
          }
        }
      }
    }

    else{
      int jornadas = (log(_participantes.length) / log(2)).floor();
      _partidos = List.generate(jornadas, (_) => []);

      for(int i = 0; i < _partidos.length; i++){
        for(int j = 0; j < _participantes.length / pow(2, i + 1) ; j++){
          Partido match = Partido(_participantes[2*j], _participantes[(2*j)+1]);
          _partidos[i].add(match);
        }
      }
    }
  }


  get getSport => _deporte;

  get getTiposTorneo => _tipo;

  get getName => _nombreTorneo;

  bool get activo => _isActivo;

  String get getAdmin => _administrador;

  get getId => _id;

  get getPartidos => _partidos;

  /*List<List<Partido>> generacionLiga() {
    List<List<Partido>> schedule = [];

    int numberOfTeams = _participantes.length;

    int totalRounds = numberOfTeams - 1;
    int matchesPerRound = numberOfTeams ~/ 2;

    for (int round = 0; round < totalRounds; round++) {
      List<Partido> roundMatches = [];

      for (int match = 0; match < matchesPerRound; match++) {
        int home = (round + match) % (numberOfTeams - 1);
        int away = (numberOfTeams - 1 - match + round) % (numberOfTeams - 1);

        if (match == 0) {
          away = numberOfTeams - 1;
        }

        Partido matchPair =
            Partido(_participantes[home], _participantes[away]);
        roundMatches.add(matchPair);
      }

      schedule.add(roundMatches);
    }


    return schedule;
  }

  List<Partido> generacionRondaEliminatoria() {
    List<Partido> ronda = [];

    if(_nextJornada == 0){
      // generar partidos con todos los equipos
      int nequipos = _participantes.length;
      int npartidos = nequipos ~/ 2;

      List<Equipo> equipos = new List<Equipo>.from(_participantes);

      equipos.shuffle();

      for(int i=0; i<nequipos; i+=2){
        ronda.add(Partido(equipos[i], equipos[i+1]));
      }

      // hay un partido suelto
      if(nequipos % 2 != 0){
        Partido part = Partido(equipos[nequipos-1], equipos[nequipos-1]);
        part.setResultado(2, 0);
        ronda.add(part);
      }

      _nextJornada+=1;
    }else{
      if(rondaTerminada()){
        List<Equipo> equipos = new List<Equipo>.from(getGanadores());
        equipos.shuffle();

        // print(equipos);

        int nequipos = equipos.length;


        for(int i=0; i<nequipos; i+=2){
          ronda.add(Partido(equipos[i], equipos[i+1]));
          // print('aniade ronda');
        }

        // hay un partido suelto
        if(nequipos % 2 != 0){
          Partido part = Partido(equipos[nequipos-1], equipos[nequipos-1]);
          part.setResultado(2, 0);
          ronda.add(part);
        }

        _nextJornada+=1;
      }
    }

    _partidos.add(ronda);

    return ronda;
  }

  bool rondaTerminada(){
    bool terminada = true;
    int npartidos = _partidos[_nextJornada-1].length ~/ 2;

    int i = 0;
    while( terminada && i < npartidos){ 
      terminada = _partidos[_nextJornada-1][i].isTerminado;
      i++;
    }

    return terminada;
  }

  //HAY QUE COMRPOBAR QUE LA JORNADA ESTÉ TERMINADA PRIMERO
  List<Equipo> getGanadores(){
    // int npartidos = _partidos[_nextJornada-1].length ~/ 2;
    List<Equipo> ganadores = [];

    for(int i=0; i<_partidos[_nextJornada-1].length; i++){
      ganadores.add(_partidos[_nextJornada-1][i].getGanador());
    }

    return ganadores;
  }

  List<List<Partido>> getPartidos(){
    return _partidos;
  }
  */
}

