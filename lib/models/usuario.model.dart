// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsuarioModel {
  int id;
  String nome;
  String nomeMae;
  String bi;
  String email;
  String token;
  bool primeiroAcesso;
  bool atualizarDadosCadastrais;
  String celular;
  DateTime dataNascimento;
  DateTime? ultimaAtualizacao;
  String? senha;

  UsuarioModel({
    required this.id,
    required this.nome,
    required this.nomeMae,
    required this.bi,
    required this.email,
    required this.token,
    required this.primeiroAcesso,
    required this.atualizarDadosCadastrais,
    required this.celular,
    required this.dataNascimento,
    this.ultimaAtualizacao,
    this.senha,
  });

  UsuarioModel copyWith({
    int? id,
    String? nome,
    String? nomeMae,
    String? bi,
    String? email,
    String? token,
    bool? primeiroAcesso,
    bool? atualizarDadosCadastrais,
    String? celular,
    DateTime? dataNascimento,
    DateTime? ultimaAtualizacao,
    String? senha,
  }) {
    return UsuarioModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      nomeMae: nomeMae ?? this.nomeMae,
      bi: bi ?? this.bi,
      email: email ?? this.email,
      token: token ?? this.token,
      primeiroAcesso: primeiroAcesso ?? this.primeiroAcesso,
      atualizarDadosCadastrais: atualizarDadosCadastrais ?? this.atualizarDadosCadastrais,
      celular: celular ?? this.celular,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      ultimaAtualizacao: ultimaAtualizacao ?? this.ultimaAtualizacao,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'nomeMae': nomeMae,
      'bi': bi,
      'email': email,
      'token': token,
      'primeiroAcesso': primeiroAcesso,
      'atualizarDadosCadastrais': atualizarDadosCadastrais,
      'celular': celular,
      'dataNascimento': dataNascimento.toIso8601String(),
      'ultimaAtualizacao': ultimaAtualizacao?.toIso8601String(),
      'senha': senha,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    DateTime dateNascimentoFormat;
    if (map['dataNascimento'].toString().contains('-')) {
      dateNascimentoFormat = DateTime.parse(map['dataNascimento']);
    } else if (map['dataNascimento'] != null) {
      dateNascimentoFormat = DateTime.fromMicrosecondsSinceEpoch(map['dataNascimento']);
    } else {
      dateNascimentoFormat = DateTime.now();
    }

    DateTime? dateAtualizacaoFormat;
    if (map['ultimaAtualizacao'].toString().contains('-')) {
      dateAtualizacaoFormat = DateTime.parse(map['ultimaAtualizacao']);
    } else if (map['ultimaAtualizacao'] != null) {
      dateAtualizacaoFormat = DateTime.fromMicrosecondsSinceEpoch(map['ultimaAtualizacao']);
    }

    final usr = UsuarioModel(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      nomeMae: map['nomeMae'] ?? '',
      bi: map['bi'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      primeiroAcesso: map['primeiroAcesso'] ?? false,
      atualizarDadosCadastrais: map['atualizarDadosCadastrais'] ?? false,
      celular: map['celular'] ?? '',
      dataNascimento: dateNascimentoFormat,
      ultimaAtualizacao: dateAtualizacaoFormat,
      senha: map['senha'] ?? '',
    );
    return usr;
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) => UsuarioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsuarioModel(id: $id, nome: $nome, nomeMae: $nomeMae, bi: $bi, email: $email, token: $token, primeiroAcesso: $primeiroAcesso, atualizarDadosCadastrais: $atualizarDadosCadastrais, celular: $celular, dataNascimento: $dataNascimento, ultimaAtualizacao: $ultimaAtualizacao, senha: $senha)';
  }

  @override
  bool operator ==(covariant UsuarioModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.nomeMae == nomeMae &&
        other.bi == bi &&
        other.email == email &&
        other.token == token &&
        other.primeiroAcesso == primeiroAcesso &&
        other.atualizarDadosCadastrais == atualizarDadosCadastrais &&
        other.celular == celular &&
        other.dataNascimento == dataNascimento &&
        other.ultimaAtualizacao == ultimaAtualizacao &&
        other.senha == senha;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        nomeMae.hashCode ^
        bi.hashCode ^
        email.hashCode ^
        token.hashCode ^
        primeiroAcesso.hashCode ^
        atualizarDadosCadastrais.hashCode ^
        celular.hashCode ^
        dataNascimento.hashCode ^
        ultimaAtualizacao.hashCode ^
        senha.hashCode;
  }

  void clear() {
    id = 0;
    nome = '';
    nomeMae = '';
    bi = '';
    email = '';
    token = '';
    primeiroAcesso = false;
    atualizarDadosCadastrais = false;
    celular = '';
    dataNascimento = DateTime.now();
    ultimaAtualizacao = null;
    senha = '';
  }

  factory UsuarioModel.clear() {
    return UsuarioModel(
      id: 0,
      nome: '',
      nomeMae: '',
      bi: '',
      email: '',
      token: '',
      primeiroAcesso: false,
      atualizarDadosCadastrais: false,
      celular: '',
      dataNascimento: DateTime.now(),
      ultimaAtualizacao: null,
      senha: '',
    );
  }
}
