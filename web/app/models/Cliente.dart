import 'Categoria.dart';
import 'Model.dart';

class Cliente implements Model {
  String _nome;
  double _consumo;
  Categoria _categoria;

  Cliente(this._nome, this._consumo, this._categoria);

  String get nome => _nome;
  double get consumo => _consumo;
  Categoria get categoria => _categoria;

  double get valor => categoria.calc_consumo(_consumo);
}
