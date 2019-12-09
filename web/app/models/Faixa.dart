import 'package:meta/meta.dart';

import 'Model.dart';

class Faixa implements Model {
  final double _min;
  final double _max;
  final double _valor;

  const Faixa._(this._min, this._max, this._valor);

  const Faixa({double min = 0, double max = double.infinity, @required valor})
      : this._(min, max, valor);

  double get min => _min;
  double get max => _max;
  double get valor => _valor;
  String get desc {
    if (min > 0 && max < double.infinity) {
      return 'excendente de $min - $max';
    } else if (min > 0) {
      return 'excendente de $min';
    } else {
      return 'até $max';
    }
  }
}
