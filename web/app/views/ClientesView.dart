import 'dart:html';

import '../models/Categoria.dart';
import '../models/Cliente.dart';
import '../models/Model.dart';
import 'View.dart';

class ClientesView extends View {
  TableSectionElement _head;
  TableSectionElement _body;
  TableSectionElement _foot;

  ClientesView(TableElement table) : super(table) {
    _head = table.createTHead();
    _body = table.createTBody();
    _foot = table.createTFoot();

    _head.addRow()
      ..addCell().text = 'NOME'
      ..addCell().text = 'CONSUMO'
      ..addCell().text = 'CATEGORIA'
      ..addCell().text = 'VALOR';

    Categoria.instancias.forEach((i) => table.createTFoot().addRow()
      ..addCell().text = i.name
      ..addCell().text = '0');
  }

  @override
  void update(Model model) {
    if (model is Cliente) {
      _body.addRow()
        ..addCell().text = model.nome
        ..addCell().text = model.consumo.toString()
        ..addCell().text = model.categoria.name
        ..addCell().text = model.valor.toString();
    }

    if (elemento is TableElement) {
      Categoria.instancias.forEach((i) => _foot.rows
              .firstWhere((row) => row.cells[0].text == i.name)
              .cells[1]
              .text =
          _body.rows.where((r) => r.cells[2].text == i.name).length.toString());
    }
  }
}
