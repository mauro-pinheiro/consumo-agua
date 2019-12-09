import 'dart:html';

import '../models/Categoria.dart';
import '../models/Cliente.dart';
import '../views/ClientesView.dart';

class ClienteController {
  ClientesView _clienteView;

  TextInputElement _inputName;
  NumberInputElement _inputConsumo;
  SelectElement _inputCategoria;

  ClienteController(this._inputName, this._inputConsumo, this._inputCategoria,
      this._clienteView);

  void adiciona(Event event) {
    event.preventDefault();
    _clienteView.update(_criaCliente());
  }

  Cliente _criaCliente() => Cliente(
      _inputName.value,
      double.parse(_inputConsumo.value),
      Categoria.map_instancias[
          _inputCategoria.options.firstWhere((o) => o.selected).value]);
}
