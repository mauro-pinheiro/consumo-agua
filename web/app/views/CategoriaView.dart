import 'dart:html';

import '../models/Categoria.dart';
import '../models/Model.dart';
import 'View.dart';

class CartegoriaView extends View {
  CartegoriaView(SelectElement elemento) : super(elemento);

  @override
  void update([Model model]) {
    Categoria.map_instancias.forEach((k, v) => elemento.append(OptionElement()
      ..value = k
      ..appendText(v.name)));
  }
}
