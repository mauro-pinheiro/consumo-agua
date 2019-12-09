import 'dart:html';

import '../models/Model.dart';

abstract class View {
  Element _elemento;

  View(this._elemento);

  void update(Model model);

  Element get elemento => _elemento;
}
