import 'package:app/ui/model/equipo.dart';
import 'package:app/utils/Enums.dart';

class Partido {
  late Equipo _local;
  late Equipo _visitante;
  EstadosPartido _estado = EstadosPartido.POREMPEZAR;
  int _golesLocal = -1;
  int _golesVisitante = -1;


  Partido(Equipo l, Equipo v){
    _local = l;
    _visitante = v;
  }

  get local => _local;
  
  get visitante => _visitante;

  get getGolesL => _golesLocal;

  get getGolesV => _golesVisitante;

  void setResultado(int gl, int gv){
    _golesLocal = gl;
    _golesVisitante = gv;
    _estado = EstadosPartido.TERMINADO;
  }

  List<int> getResultado(){
    List<int> resultado = [];

    resultado.add(_golesLocal);
    resultado.add(_golesVisitante);

    return resultado;
  }

  Equipo getGanador(){
    return (_golesLocal>_golesVisitante)? _local : _visitante; 
  }

  EstadosPartido get estado => _estado;
}