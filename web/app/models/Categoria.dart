import 'Faixa.dart';
import 'Model.dart';

class Categoria implements Model {
  final String _name;
  final List<Faixa> _faixas;

  static final _intancias = <String, Categoria>{};

  const Categoria._(this._name, this._faixas);

  static void init() {
    Categoria.residencial;
    Categoria.popular;
    Categoria.filantropicas;
    Categoria.comercial;
    Categoria.pequenosNegocios;
    Categoria.industrial;
    Categoria.publicas;
  }

  const Categoria._residencial()
      : this._('Residencial', const <Faixa>[
          Faixa(max: 10.0, valor: 2.55),
          Faixa(min: 10.0, max: 20.0, valor: 5.16),
          Faixa(min: 20.0, max: 30.0, valor: 8.18),
          Faixa(min: 30.0, max: 50.0, valor: 10.39),
          Faixa(min: 50.0, valor: 16.31)
        ]);

  const Categoria._popular()
      : this._('Residencial Popular', const <Faixa>[
          Faixa(max: 10.0, valor: 1.93),
          Faixa(min: 10.0, max: 20.0, valor: 5.16),
          Faixa(min: 20.0, max: 30.0, valor: 8.18),
          Faixa(min: 30.0, max: 50.0, valor: 10.39),
          Faixa(min: 50.0, valor: 16.31)
        ]);

  const Categoria._filantropicas()
      : this._('Entidades Filantrópicas', const <Faixa>[
          Faixa(max: 10.0, valor: 1.93),
          Faixa(min: 10.0, valor: 1.93),
        ]);

  const Categoria._comercial()
      : this._('Comercial', const <Faixa>[
          Faixa(max: 15.0, valor: 8.83),
          Faixa(min: 15.0, max: 100.0, valor: 11.78),
          Faixa(min: 100.0, valor: 10.23),
        ]);

  const Categoria._pequenosNegocios()
      : this._('Comercial Pequenos Negócios', const <Faixa>[
          Faixa(max: 15.0, valor: 5.29),
          Faixa(min: 15.0, max: 100.0, valor: 11.36),
          Faixa(min: 100.0, valor: 10.23),
        ]);

  const Categoria._industrial()
      : this._('Industrial', const <Faixa>[
          Faixa(max: 15.0, valor: 9.05),
          Faixa(min: 15.0, max: 100.0, valor: 11.23),
          Faixa(min: 100.0, valor: 10.23),
        ]);

  const Categoria._publicas()
      : this._('Públicas', const <Faixa>[
          Faixa(max: 15.0, valor: 9.07),
          Faixa(min: 15.0, valor: 14.85),
        ]);

  String get name => _name;
  List<Faixa> get faixas => List.from(_faixas);

  static List<Categoria> get instancias => List.from(_intancias.values);
  static Map<String, Categoria> get map_instancias => Map.from(_intancias);

  static Categoria get residencial =>
      _intancias['Residencial'] ??= Categoria._residencial();

  static Categoria get popular =>
      _intancias['Popular'] ??= Categoria._popular();

  static Categoria get filantropicas =>
      _intancias['Filantropicas'] ??= Categoria._filantropicas();

  static Categoria get comercial =>
      _intancias['Comercial'] ??= Categoria._comercial();

  static Categoria get pequenosNegocios =>
      _intancias['PequenosNegocios'] ??= Categoria._pequenosNegocios();

  static Categoria get industrial =>
      _intancias['Industrial'] ??= Categoria._industrial();

  static Categoria get publicas =>
      _intancias['Pubicas'] ??= Categoria._publicas();

  double calc_consumo(double consumo) {
    if (consumo <= 0) return 0;
    var faixa = _faixas.firstWhere((f) => consumo <= f.max);
    return calc_consumo(faixa.min) + (consumo - faixa.min) * faixa.valor;
  }
}
