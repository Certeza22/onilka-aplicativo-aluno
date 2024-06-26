// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int id = 0;
  String nome;
  String nomeMae;
  String bi;
  String email;
  String token;
  bool primeiroAcesso;
  bool atualizarDadosCadastrais;
  String celular;
  DateTime dataNascimento;
  String? senha;
  User({
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
    this.senha,
  });

  User copyWith({
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
    String? senha,
  }) {
    return User(
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
      'dataNascimento': dataNascimento.millisecondsSinceEpoch,
      'senha': senha,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      nome: map['nome'] as String,
      nomeMae: map['nomeMae'] as String,
      bi: map['bi'] as String,
      email: map['email'] as String,
      token: map['token'] as String,
      primeiroAcesso: map['primeiroAcesso'] as bool,
      atualizarDadosCadastrais: map['atualizarDadosCadastrais'] as bool,
      celular: map['celular'] as String,
      dataNascimento: DateTime.parse(map['dataNascimento']),
      senha: map['senha'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, nome: $nome, nomeMae: $nomeMae, bi: $bi, email: $email, token: $token, primeiroAcesso: $primeiroAcesso, atualizarDadosCadastrais: $atualizarDadosCadastrais, celular: $celular, dataNascimento: $dataNascimento, senha: $senha)';
  }

  @override
  bool operator ==(covariant User other) {
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
        senha.hashCode;
  }
}
