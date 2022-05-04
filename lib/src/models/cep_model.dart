class CepModel {
  String? cep;
  String? logradouro;
  String? bairro;
  String? localidade;
  String? uf;

  CepModel({
    this.cep,
    this.logradouro,
    this.bairro,
    this.localidade,
    this.uf,
  });

  CepModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    return data;
  }  
}
