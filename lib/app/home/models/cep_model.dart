class CepModel {
  String? cep;
  String? logradouro;
  String? complomento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  CepModel(
      {this.cep,
      this.logradouro,
      this.complomento,
      this.bairro,
      this.localidade,
      this.uf,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafi});

  CepModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'] ?? '';
    logradouro = json['logradouro'] ?? '';
    complomento = json['complemento'] ?? '';
    bairro = json['bairro'] ?? '';
    localidade = json['localidade'] ?? '';
    uf = json['uf'] ?? '';
    ibge = json['ibge'] ?? '';
    ddd = json['ddd'] ?? '';
    siafi = json['siafi'] ?? '';
  }
}
