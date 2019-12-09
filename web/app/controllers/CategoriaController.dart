import '../models/Categoria.dart';
import '../views/CategoriaView.dart';

class CategoriaController {
  CartegoriaView _view;

  CategoriaController(this._view) {
    Categoria.init();
    _view.update();
  }
}
