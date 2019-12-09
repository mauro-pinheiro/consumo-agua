import 'dart:html';

import 'app/controllers/CategoriaController.dart';
import 'app/controllers/ClienteController.dart';
import 'app/views/CategoriaView.dart';
import 'app/views/ClientesView.dart';

void main() {
  // var models = <Cliente>[
  //   Cliente('mauro', 100, Categoria.residencial),
  //   Cliente('mauro', 100, Categoria.comercial),
  //   Cliente('mauro', 100, Categoria.residencial),
  // ];
  var table = TableElement();

  CategoriaController(CartegoriaView(querySelector('#select-categoria')));

  var clienteController = ClienteController(
      querySelector('input[name=nome]'),
      querySelector('input[name=consumo]'),
      querySelector('#select-categoria'),
      ClientesView(table));

  querySelector('#form-cliente')
      .onSubmit
      .listen((event) => clienteController.adiciona(event));

  // ClientesView(table).update(models);
  querySelector('#dart-cliente-view').append(table);
}
