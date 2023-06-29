class Equipo {
  String _nombreEquipo;
  List<String> _jugadores; //en la base de datos se asignara automaticamente
  String _entrenador;
  String _administrador;

  Equipo(this._nombreEquipo, this._jugadores, this._entrenador, this._administrador);

  String get nombreEquipo{
    return _nombreEquipo;
  }

  List<String> get jugadores{
    return _jugadores;
  }

  String get entrenador{
    return _entrenador;
  }

  String get administrador{
    return _administrador;
  }
}